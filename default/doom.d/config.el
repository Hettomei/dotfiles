;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Timothée GAUTHIER"
      user-mail-address "timothee.gauthier@consertotech.pro")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; TIM custom add. ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Please do not add variable using easy custom. Or it will be hard to save configuration.

(after! undo-tree
  (setq undo-tree-auto-save-history nil))

(setq hscroll-margin 15
      ;; hscroll-step 1
      ;; scroll-conservatively 10000
      ;; scroll-step 1
      scroll-margin 5)

(add-to-list 'auto-mode-alist '("\\.bashrcc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.profilee\\'" . sh-mode))

(defun tim/get-file-path ()
  "Get file path even when in dired-mode. Taken from https://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs"
  (if (eq major-mode 'dired-mode)
      (dired-get-filename)
    (or (buffer-file-name) "")))

(defun copy-file-name ()
  "Copy the buffer file name."
  (interactive)
  (let ((name (file-name-nondirectory (tim/get-file-path))))
    (message "Copied: %s" name)
    (kill-new name)))

(defun copy-file-path ()
  "Copy the buffer full path."
  (interactive)
  (let ((name (tim/get-file-path)))
    (message "Copied: %s" name)
    (kill-new name)))

(defun middle-of-line-forward ()
  "Put cursor at the middle point of the line. try to mimic vim-skip"
  (interactive)
  (goto-char (/ (+ (point) (point-at-eol)) 2)))

(defun middle-of-line-backward ()
  "Put cursor at the middle point of the line. try to mimic vim-skip"
  (interactive)
  (goto-char (/ (+ (point) (point-at-bol)) 2)))

(defun tim-go-up-or-create ()
  "Go up window. If error, create it"
  (interactive)
  (condition-case nil
      (evil-window-up 1)
    (user-error
     (+evil-window-split-a)
     (evil-window-up 1))))

(defun tim-go-down-or-create ()
  "Go down window. If error, create it"
  (interactive)
  (condition-case nil
      (evil-window-down 1)
    (user-error
     (+evil-window-split-a))))

(defun tim-go-left-or-create ()
  "Go left window. If error, create it"
  (interactive)
  (condition-case nil
      (evil-window-left 1)
    (user-error
     (+evil-window-vsplit-a)
     (evil-window-left 1))))

(defun tim-go-right-or-create ()
  "Go right window. If error, create it"
  (interactive)
  (condition-case nil
      (evil-window-right 1)
    (user-error
     (+evil-window-vsplit-a))))

(defun delete-and-replace-word ()
  "Delete the word and go in insert mode. When word is not found go forward-word"
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (if bounds
        (progn
          ;; kill-region will save it in kill ring. Delete just delete
          (delete-region (car bounds) (cdr bounds))
          (evil-insert 1))
      (progn
        ;; When word not found.... continue. It will call this method a maximum of 500 (see max-lisp-eval-depth)
        (forward-word)
        (delete-and-replace-word)))))

(defun copy-word ()
  "Copy the word. When word is not found go forward-word"
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (if bounds
        (copy-region-as-kill (car bounds) (cdr bounds))
      (progn
        ;; When word not found.... continue. It will call this method a maximum of 500 (see max-lisp-eval-depth)
        (forward-word)
        (copy-word)))))

(defun replace-with-paste ()
  "Delete the word and Paste another on it. When word is not found go forward-word"
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (if bounds
        (progn
          ;; kill-region will save it in kill ring. Delete just delete
          (delete-region (car bounds) (cdr bounds))
          (yank))
      (progn
        ;; When word not found.... continue. It will call this method a maximum of 500 (see max-lisp-eval-depth)
        (forward-word)
        (replace-with-paste)))))

(defun set-case-insensitive ()
  "Ignore case for vim-search"
  (interactive)
  (setq evil-ex-search-case (quote insensitive)))

(defun set-case-sensitive ()
  "Consider case for vim-search"
  (interactive)
  (setq evil-ex-search-case (quote sensitive)))

(defun set-case-smart ()
  "Smart case for vim-search"
  (interactive)
  (setq evil-ex-search-case (quote smart)))

(after! evil
  (setq evil-ex-search-case (quote sensitive))
  (setq evil-search-wrap nil)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t))

;; disable smartparens that automatically completed " with a second " (same for ''())
;; It also do a good job dealing with () movement, see https://smartparens.readthedocs.io/en/latest/
;; update: cannot disable in ./packages.el because it is a core package. Need to disable hook.
(after! smartparens
  (smartparens-global-mode -1))

;; Will tell you your frequence
;; It is possible to filter some pattern.
;; To know :
;; M-x keyfreq-show
(use-package! keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

;; (evil-define-key 'normal 'global (kbd "C-<left>") 'evil-window-left)
;; (evil-define-key 'normal 'global (kbd "C-<down>") 'evil-window-down)
;; (evil-define-key 'normal 'global (kbd "C-<up>") 'evil-window-up)
;; (evil-define-key 'normal 'global (kbd "C-<right>") 'evil-window-right)

;; Redefine syntax for vimrc file.
;; Thanks to https://stackoverflow.com/questions/4236808/syntax-highlight-a-vimrc-file-in-emacs
(define-generic-mode 'vimrc-generic-mode
  '()
  '()
  '(("^[\t ]*:?\\(!\\|ab\\|map\\|unmap\\)[^\r\n\"]*\"[^\r\n\"]*\\(\"[^\r\n\"]*\"[^\r\n\"]*\\)*$"
     (0 font-lock-warning-face))
    ("\\(^\\|[\t ]\\)\\(\".*\\)$"
     (2 font-lock-comment-face))
    ("\"\\([^\n\r\"\\]\\|\\.\\)*\""
     (0 font-lock-string-face)))
  '("/vimrc\\'" "\\.vim\\(rc\\)?\\'")
  '((lambda ()
      (modify-syntax-entry ?\" ".")))
  "Generic mode for Vim configuration files.")

;; increment or decrement numbers
;; Taken from : https://www.emacswiki.org/emacs/IncrementNumber
(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))
(defun my-decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) -1)))

(map! (:map doom-leader-map "SPC" #'save-buffer)
      :n "C-p" #'+ivy/projectile-find-file
      :n "C-w x" #'window-swap-states

      :n "s" #'middle-of-line-forward
      :n "S" #'middle-of-line-backward

      :n "C-<up>" #'tim-go-up-or-create
      :n "C-<down>" #'tim-go-down-or-create
      :n "C-<left>" #'tim-go-left-or-create
      :n "C-<right>" #'tim-go-right-or-create

      (:map doom-leader-map "r" #'delete-and-replace-word)
      ;; Temporary disable because doom map project on this
      ;; (:map doom-leader-map "p" #'replace-with-paste)
      (:map doom-leader-map "y" #'copy-word)
      (:map doom-leader-map "e" #'counsel-find-file)

      :v "v" #'er/expand-region
      :n "M-+" #'my-increment-number-decimal
      :n "M--" #'my-decrement-number-decimal)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Tips ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To discover default command :
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/api.org
;; To manage package
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#package-management

;; After updating, please run M-x doom/reload

;; C-u M-! inserts the result of the ‘shell-command’



;; Extracted from my old custom.el
;; Maybe I ll have to reinsert this into doom
;; '(web-mode-comment-formats
;;   (quote
;;    (("java" . "/*")
;;     ("javascript" . "//")
;;     ("php" . "/*")
;;     ("css" . "/*"))))
;; '(xterm-mouse-mode t))

;; (global-whitespace-mode)
;; (setq whitespace-style '(face empty trailing))


;; To save session :
;; M-x desktop-save
;; Then reopen emacs then
;; M-x desktop-change-dir
;; And find dir

;; How to quickly create a new mode :
;; https://emacs.stackexchange.com/questions/2533/how-can-i-prevent-flycheck-mode-from-checking-certain-files/2541#2541?newreg=6182441417524097a0075ad78c8b187a :
;; you can also find a new mode in evil-config.el
;; (define-derived-mode my-cfg-mode sh-mode "My CFg Mode"
;;   "A mode for my CFg files."
;;   (sh-set-shell "bash"))
;; (add-to-list 'auto-mode-alist '("\\.cfg\\'" . my-cfg-mode))


;; count number of occurence
;; M-x swipper RET

;; Very good function with choice
;; Taken from https://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs"
;;
;; (defun copy-buffer-file-name-as-kill (choice)
;;   "Copyies the buffer {name/mode}, file {name/full path/directory} to the kill-ring."
;;   (interactive "cCopy (b) buffer name, (m) buffer major mode, (f) full buffer-file path, (d) buffer-file directory, (n) buffer-file basename")
;;   (let ((new-kill-string)
;;         (name (if (eq major-mode 'dired-mode)
;;                   (dired-get-filename)
;;                 (or (buffer-file-name) ""))))
;;     (cond ((eq choice ?f)
;;            (setq new-kill-string name))
;;           ((eq choice ?d)
;;            (setq new-kill-string (file-name-directory name)))
;;           ((eq choice ?n)
;;            (setq new-kill-string (file-name-nondirectory name)))
;;           ((eq choice ?b)
;;            (setq new-kill-string (buffer-name)))
;;           ((eq choice ?m)
;;            (setq new-kill-string (format "%s" major-mode)))
;;           (t (message "Quit")))
;;     (when new-kill-string
;;       (message "%s copied" new-kill-string)
;;       (kill-new new-kill-string))))
