;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic emacs configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment "UTF-8")

(setq inhibit-startup-screen t)
(setq make-backup-files nil) ; stop creating ~ files

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto load 'use-package so it can autoload other packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

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
  ;; thanks to https://github.com/noctuid/evil-guide
  ;; set leader key in all states
  (evil-set-leader nil (kbd "C-SPC"))
  ;; set leader key in normal state
  (evil-set-leader 'normal (kbd "SPC"))
  ;; set local leader
  (evil-set-leader 'normal "," t)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'save-buffer))


(use-package org
  :ensure t)

;;;;;;;;;;;;;;;;;;
;; Other config
;;;;;;;;;;;;;;;;;;

(global-display-line-numbers-mode)

;; Put init.el into C-x b for convenience
(find-file "c:/Users/tim/AppData/Roaming/.emacs.d/init.el")

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;(global-set-key (kbd "C-c l") #'org-store-link)
;;(global-set-key (kbd "C-c a") #'org-agenda)
;;(global-set-key (kbd "C-c c") #'org-capture)

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
