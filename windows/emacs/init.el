(setq inhibit-startup-screen t)

(set-language-environment "UTF-8")

;; Put init.el into C-x b for convenience
(find-file "c:/Users/tim/AppData/Roaming/.emacs.d/init.el")

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(package-initialize)

;; How to add a new package
;; active this on the first run, not always

;; to make these lines available you have to
;; alt-x package-refresh-contents
;; alt-x package-list-packages
;; C-s
;; find evil
;; install

;; Evil auto install https://github.com/emacs-evil/evil/tree/release-1.14 :
(unless (package-installed-p 'evil)
  (progn
    (package-refresh-contents)
    (package-install 'evil)))

(unless (package-installed-p 'undo-fu)
  (progn
    (package-refresh-contents)
    (package-install 'undo-fu)))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq make-backup-files nil) ; stop creating ~ files
(global-display-line-numbers-mode)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq evil-ex-search-case (quote sensitive)
      evil-search-wrap nil
      evil-split-window-below t
      evil-vsplit-window-right t
      evil-cross-lines t
      evil-echo-state nil ; do not display "insert"
      ;; evil-search-module 'isearch ; Try it, I can't find the difference on internet
      evil-ex-substitute-global t ; automatic g in :s/aa/bb/g
      evil-undo-system 'undo-fu) ; Or C-r will not work
