;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic emacs configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment "UTF-8")
(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(cond
 ((string-equal system-type "windows-nt")
  (progn
    (setq default-process-coding-system '(utf-8-dos . utf-8-dos)))))

(setq inhibit-startup-screen t)
(setq make-backup-files nil) ; stop creating ~ files
(cond
 ((string-equal system-type "windows-nt")
  (progn
    (setq chocolatey-root "c:/ProgramData/chocolatey")
    (setq chocolatey-lib
          (concat chocolatey-root "/" "lib"))
    (setq chocolatey-bin
          (concat chocolatey-root "/" "bin")))))
(cond
 ((string-equal system-type "windows-nt") 
  (progn
    (setq ispell-program-name 
          (concat chocolatey-lib "/" "hunspell.portable/tools/bin/hunspell"))))
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto load 'use-package so it can autoload other packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) ;; sometimes you have to comment this one. Like for lsp for example
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; defun me/my-functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun me/replace-at-point ()
  "Delete the symbol and go in insert mode. Equivalent to ciw without saving in register"
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'symbol)))
    (cond (thing
           (delete-region (car thing) (cdr thing))
           (evil-insert 1))
          (t
           (forward-char) (me/replace-at-point)))))

(defun me/kill-at-point ()
  "Kills the symbol at point."
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'symbol)))
    (kill-region (car thing) (cdr thing))
    (message "current-kill: %s" (current-kill 0 'do-not-move))))

(defun me/copy-symbol ()
  "Copy the symbol at point. Move forward if nothing found."
  (interactive)
  (let ((thing (thing-at-point 'symbol)))
    (cond (thing
           (kill-new thing) (message "current-kill: %s" thing))
          (t
           (forward-char) (me/copy-symbol)))))

(defun me/copy-append-symbol ()
  "Copy the symbol at point. Move forward if nothing found."
  (interactive)
  (let ((thing (thing-at-point 'symbol 'no-properties)))
    (cond (thing
           (kill-append (concat " " thing) nil) (message "current-kill: %s" (current-kill 0 'do-not-move)))
          (t
           (forward-char) (me/copy-append-symbol)))))

(defun me/replace-with-kill-ring ()
  "Delete the inner symbol and paste another on it. Do not save in register the replaced symbol"
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'symbol)))
    (cond (thing
           (delete-region (car thing) (cdr thing))
           (yank))
          (t
           (forward-char) (me/replace-with-kill-ring)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install everything with use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit
  :ensure t)

;; Vim style undo not needed for emacs 28
(use-package undo-fu
  :ensure t)

(use-package evil
  :ensure t
  :requires undo-fu ;; should not be needed in emacs 28 but... need it on emacs 28 windows
  :init (setq evil-ex-search-case (quote sensitive)
	      evil-search-wrap nil
	      evil-split-window-below t
	      evil-vsplit-window-right t
	      evil-cross-lines t
	      evil-echo-state nil ; do not display "insert"
	      ;; evil-search-module 'isearch ; Try it, I can't find the difference on internet
	      evil-ex-substitute-global t ; automatic g in :s/aa/bb/g
	      evil-undo-system 'undo-fu); Or C-r will not work
  :config (evil-mode 1) 

  (defalias #'forward-evil-word #'forward-evil-symbol)

  (evil-define-motion me/middle-of-line-forward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    :type inclusive
    (goto-char (/ (+ (point) (point-at-eol)) 2)))

  (evil-define-motion me/middle-of-line-backward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    :type inclusive
    (goto-char (/ (+ (point) (point-at-bol)) 2)))

  ;; thanks to https://github.com/noctuid/evil-guide
  ;; set leader key in all states
  (evil-set-leader nil (kbd "C-SPC"))
  ;; set leader key in normal state
  (evil-set-leader 'normal (kbd "SPC"))
  ;; set local leader
  (evil-set-leader 'normal "," t)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "s") #'me/middle-of-line-forward)
  (evil-define-key 'normal 'global (kbd "S") #'me/middle-of-line-backward)
  (evil-define-key 'normal 'global (kbd "<leader>r") #'me/replace-at-point) ;; "Delete and go insert"
  (evil-define-key 'normal 'global (kbd "<leader>d") #'me/kill-at-point) ;; ""
  (evil-define-key 'normal 'global (kbd "<leader>p") #'me/replace-with-kill-ring) ;; "Replace with killed"
  (evil-define-key 'normal 'global (kbd "<leader>e") #'find-file) ;; "select file"
  )


(use-package org
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package flyspell
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;;(load-theme 'doom-one t)
  (load-theme 'doom-solarized-dark t)


  (doom-themes-org-config))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;;(setq lsp-keymap-prefix "SPC l")
  (setq lsp-keymap-prefix "l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 (c++-mode . lsp)
	 ;; if you want which-key integration
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))
;;;;;;;;;;;;;;;;;;
;; Other config
;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(tool-bar-mode -1) 
(windmove-default-keybindings)
(setq windmove-create-window t)

(global-display-line-numbers-mode)

;; Put init.el into C-x b for convenience
(find-file "c:/Users/tim/AppData/Roaming/.emacs.d/init.el")
(find-file "c:/msys64/home/tim/programmes/codingame/cplusplus/sdl_03_triangles_paint/main.cpp")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(text-scale-increase 3)
;;(global-set-key (kbd "C-c l") #'org-store-link)
;;(global-set-key (kbd "C-c a") #'org-agenda)
;;(global-set-key (kbd "C-c c") #'org-capture)

;; stolen at https://github.com/tompurl/dot-emacs/blob/master/emacs-init.org
(defun me/encoding/dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix 't))
;; Automatically cut long lines.
;; Maybe I should use it only in text-mode
(setq-default fill-column 100)
(setq-default auto-fill-function 'do-auto-fill)

;;;;;;;;;;;;;;;;;;;;;;;
;; Automatically added
;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
