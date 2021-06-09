(setq inhibit-startup-screen t)

(set-language-environment "UTF-8")

;; Put init.el into C-x b for convenience
(find-file "c:/Users/Dev.PC-CONSERTO/AppData/Roaming/.emacs.d/init.el")
(find-file "C:/Users/Dev.PC-CONSERTO/Documents/partage.org")

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(package-initialize) 

;; to make these lines available you have to
;; alt-x package-list-packages
;; C-s
;; find evil
;; install
(require 'evil)
(evil-mode t)


