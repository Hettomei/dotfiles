(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" default)))
 '(evil-backspace-join-lines t)
 '(evil-want-Y-yank-to-eol t)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil nil nil "Do not display menu bar on top of emacs")
 '(package-selected-packages
   (quote
    (markdown-mode evil-commentary evil-numbers typescript-mode evil-surround ag evil elscreen)))
 '(save-place-mode t nil nil "Save current position of file")
 '(savehist-mode t nil nil "Save M-x history")
 '(show-paren-mode t)
 '(tool-bar-mode nil nil nil "Do not display the second bar in gui")
 '(truncate-lines t))

(when (display-graphic-p)
  (load-theme 'solarized-dark t))

(require 'evil)
(evil-mode 1)

;; https://github.com/emacs-evil/evil-surround
;; To remove the delimiters entirely to 'Hello world!' press ds'.  Hello world!. or ysiw( . or visual mode then S(
(require 'evil-surround)
(global-evil-surround-mode 1)

;; set leader to space
(evil-set-leader 'normal (kbd "SPC"))
;; cannot use <leader><leader>
(evil-define-key 'normal 'global (kbd "<leader>SPC") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>e") 'find-file)
;; Need to refine this <leader>f: need to display file name
(evil-define-key 'normal 'global (kbd "<leader>f") 'find-file)
(evil-define-key 'normal 'global (kbd "C-h") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "C-j") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "C-k") 'evil-window-up)
(evil-define-key 'normal 'global (kbd "C-l") 'evil-window-right)

(evil-define-key 'normal 'global (kbd "C-w <left>") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "C-w <down>") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "C-w <up>") 'evil-window-up)
(evil-define-key 'normal 'global (kbd "C-w <right>") 'evil-window-right)

(elscreen-start)
(define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;create tab
(define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab

(define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
(define-key evil-normal-state-map "gt" 'elscreen-next) ;next tab

(evil-commentary-mode)

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

(defun middle-of-line-forward ()
  "Put cursor at the middle point of the line. try to mimic vim-skip"
  (interactive)
  (goto-char (/ (+ (point) (point-at-eol)) 2)))

(defun middle-of-line-backward ()
  "Put cursor at the middle point of the line. try to mimic vim-skip"
  (interactive)
  (goto-char (/ (+ (point) (point-at-bol)) 2)))

(define-key evil-normal-state-map (kbd "s") 'middle-of-line-forward)
(define-key evil-normal-state-map (kbd "S") 'middle-of-line-backward)

;; (defun middle-of-file-forward ()
;;   "Put cursor at the middle point of the line. try to mimic vim-skip"
;;   (interactive)
;;   (goto-char (/ (+ (point) (point-at-eol)) 2)))

;; (define-key evil-normal-state-map (kbd "M-s") 'middle-of-line-forward)
