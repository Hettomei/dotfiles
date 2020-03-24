;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


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
;; (setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.

(if (display-graphic-p)
    (setq doom-theme 'doom-one)
  (setq doom-theme 'doom-solarized-dark))
  ;; (setq doom-theme 'doom-one))

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers,
;; change this to `relative' or t or `nil' to disable it:
;; Line numbers are pretty slow all around. The performance boost of
;; disabling them outweighs the utility of always keeping them on.
(setq display-line-numbers-type nil)


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

(custom-set-faces!
 '(line-number :foreground "dim gray")
 '(line-number-current-line :foreground "white")
 '(doom-modeline-project-dir :foreground "blue")
 '(doom-modeline-buffer-path   :foreground "blue")
 '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
 '(mode-line :background "light gray" :foreground "black" :height 80))

(unless (display-graphic-p)
  (custom-set-faces!
    '(font-lock-doc-face :foreground "#ffffff")))

(global-whitespace-mode)

(setq doom-font (font-spec :family "monospace" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans")

      ;; Uncomment this line if you don't like having a prompt that ask to quit
      ;; confirm-kill-emacs nil

      ;; Try to disable to see if related with search jump
      ;; Always display 5 lines
      hscroll-margin 10
      auto-hscroll-mode 'current-line
      scroll-margin 5
      ;; Avoid jump when search
      scroll-preserve-screen-position nil
      whitespace-style '(face empty trailing)

      ;; Disable help mouse-overs for mode-line segments (i.e. :help-echo text).
      ;; They're generally unhelpful and only add confusing visual clutter.
      mode-line-default-help-echo nil
      show-help-function nil
      company-idle-delay nil)


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

(defun tim-delete-and-replace-word ()
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
        (tim-delete-and-replace-word)))))

(defun tim-kill-word ()
  "Delete the word and go in insert mode. When word is not found go forward-word"
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (if bounds
          ;; kill-region will save it in kill ring. delete-region just delete
          (kill-region (car bounds) (cdr bounds))
      (progn
        ;; When word not found.... continue. It will call this method a maximum of 500 (see max-lisp-eval-depth)
        (forward-word)
        (tim-kill-word)))))

(defun tim-copy-word ()
  "Copy the word. When word is not found go forward-word"
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (if bounds
        (copy-region-as-kill (car bounds) (cdr bounds))
      (progn
        ;; When word not found.... continue. It will call this method a maximum of 500 (see max-lisp-eval-depth)
        (forward-word)
        (tim-copy-word)))))

(defun tim-replace-with-paste ()
  "Delete the word and Paste another on it. When word is not found go forward-word. Do not save in register the replaced word"
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
        (tim-replace-with-paste)))))

(defun set-case-insensitive ()
  "Ignore case for vim-search"
  (interactive)
  (setq evil-ex-search-case (quote insensitive)))

(defalias 'set-ignore-case 'set-case-insensitive)

(defun set-case-sensitive ()
  "Consider case for vim-search"
  (interactive)
  (setq evil-ex-search-case (quote sensitive)))

(defalias 'set-no-ignore-case 'set-case-sensitive)

(defun set-case-smart ()
  "Smart case for vim-search"
  (interactive)
  (setq evil-ex-search-case (quote smart)))

(defun tim-search-only-word (&optional symbol arg)
  "Go right window. If error, create it"
  (interactive
   (list (rxt-quote-pcre (or (doom-thing-at-point-or-region) ""))
         current-prefix-arg))
  (let ((counsel-rg-base-command (concat counsel-rg-base-command " -w --case-sensitive")))
    (+default/search-project-for-symbol-at-point symbol arg)))

(defun tim-search-word (&optional symbol arg)
  (interactive
   (list (rxt-quote-pcre (or (doom-thing-at-point-or-region) ""))
         current-prefix-arg))
  (+default/search-project-for-symbol-at-point symbol arg))
;; fdsfdsarg
;; argdvfgvgfd
;; vcdxsvfdcxargbvcxdvcdx
;; arg


;; We can change it by mode with :
;; (add-hook! 'python-mode-hook (modify-syntax-entry ?_ "w"))
;; or read https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
(defun improve-word-length ()
  "This way, when do a tim-copy-word on entry, it copies 'modify-syntax-entry'"
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?- "w"))

(add-hook 'after-change-major-mode-hook #'improve-word-length)

;; auto-fill-mode is automatic line break
(remove-hook 'text-mode-hook #'auto-fill-mode)

(after! evil
  (setq evil-ex-search-case (quote sensitive)
        evil-search-wrap nil
        evil-split-window-below t
        evil-vsplit-window-right t)

  (evil-define-motion tim-middle-of-line ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    :type inclusive
    (goto-char (/ (+ (point) (point-at-eol)) 2)))

  (evil-define-motion tim-middle-of-line-backward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    (interactive)
    (goto-char (/ (+ (point) (point-at-bol)) 2)))

  (evil-define-motion tim-re-search-forward (count &optional symbol)
    "Fix bug when you are on the last search and it tells 'nothing is found'... which is wrong"
    :jump t
    :type exclusive
    (interactive (list (prefix-numeric-value current-prefix-arg)
                       evil-symbol-word-search))
    (let ((evil-search-wrap t)) ;; temporary override wrap
      (evil-ex-search-word-forward count symbol))))


;; disable smartparens that automatically completed " with a second " (same for ''())
;; It also do a good job dealing with () movement, see https://smartparens.readthedocs.io/en/latest/
;; update: cannot disable in ./packages.el because it is a core package. Need to disable hook.
(after! smartparens
  (smartparens-global-mode -1))

(defun tim-reuse-ivy-line-to-open-file (filename)
  (let ((file (car (split-string filename ":"))))
    (message "try to open %s by splitting -> %s" file filename)
    (condition-case err
        (counsel-projectile-find-file-action file)
      (void-function ; <- that s the error handler name
       (message "open fail with projectile, try find-file. Error was: %s" err)
       (find-file file))))
  (ivy-resume))

(defun tim-ivy-find-and-open-up (filename)
  (split-window-below)
  (tim-reuse-ivy-line-to-open-file filename))

(defun tim-ivy-find-and-open-right (filename)
  (split-window-right)
  (other-window 1)
  (tim-reuse-ivy-line-to-open-file filename))

(defun tim-ivy-find-and-open-rightr ()
  (interactive)
  (ivy-dispatching-call))
  ;; (split-window-right)
  ;; (other-window 1))

(defun tim-ivy-find-and-open-rightrr ()
  (message "open right")
  (split-window-right)
  (other-window 1))

(defun tim-ivy-find-and-open-below (filename)
  (split-window-below)
  (other-window 1)
  (tim-reuse-ivy-line-to-open-file filename))

(defun tim-ivy-find-and-open-left (filename)
  (split-window-right)
  (tim-reuse-ivy-line-to-open-file filename))

;; +evil/window-move-right is not mean to do what i want
(defun tim-ivy-find-and-open-full-right (filename)
  (split-window-right)
  (other-window 1)
  (+evil/window-move-right)
  (tim-reuse-ivy-line-to-open-file filename))

(defun test-test ()
  (interactive)
  (message "ok "))

(use-package ivy
  :bind (:map ivy-minibuffer-map
          ("C-p" . ivy-previous-history-element)
          ("S-<right>" . tim-ivy-find-and-open-rightr))
  :config (setq ivy-wrap nil
                ivy-count-format "%d/%d "
                ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-cd-selected)
  ;; Display on top left something like [3] to tell you are 3 recursing minibuffer depth
  (minibuffer-depth-indicate-mode 99))


(after! ivy

  ;; Thanks to
  ;; https://github.com/abo-abo/swiper/blob/master/doc/ivy.org#actions and
  ;; https://www.reddit.com/r/emacs/comments/efg362/ivy_open_selection_vertically_or_horizontally/
  ;; I can open any windows using C-o then C-l C-k ....
  (ivy-set-actions
   t
   '(
     ("C-k" tim-ivy-find-and-open-up "open up")
     ("C-l" tim-ivy-find-and-open-right "open right")
     ;; ("C-<right>" tim-ivy-find-and-open-rightrr "open right")
     ;; ("C-l" tim-ivy-find-and-open-rightrr "open right")
     ;; ("C-L" tim-ivy-find-and-open-full-right "open full right")
     ("C-j" tim-ivy-find-and-open-below "open below")
     ("C-h" tim-ivy-find-and-open-left "open left"))))

;; Keep evil-snipe but disable 's' mapping
(after! evil-snipe
  (evil-snipe-mode -1))

;; I don't want persistent undo
(after! undo-tree
  (setq undo-tree-auto-save-history nil))

(after! counsel
  :config
  ;; Thanks to https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-counsel.el
  ;; (setq counsel-rg-base-command "rg --with-filename --no-heading --line-number --hidden --color never %s"))
  (setq counsel-rg-base-command (concat counsel-rg-base-command " --hidden")))

;; I don't want to quit insert mode with jk : remove
(after! evil-escape
  :config
  (setq evil-escape-key-sequence nil))

(after! flycheck
  :config
  (setq-default flycheck-disabled-checkers '(python-flake8)))


;; (after! modeline
;;   (setq doom-modeline-height 5)
;;   )

;; Will tell you your frequence
;; It is possible to filter some pattern.
;; To know :
;; M-x keyfreq-show
;; To enable it : enable package in package.el and uncomment these next lines
;; (use-package! keyfreq
;;   :config
;;   (setq keyfreq-excluded-commands
;;         '(self-insert-command
;;           evil-next-line
;;           evil-previous-line
;;           ivy-next-line
;;           evil-forward-char
;;           evil-backward-char
;;           ivy-backward-delete-char))
;;   (keyfreq-mode 1)
;;   (keyfreq-autosave-mode 1))

(use-package! egg-timer)

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

;; Thanks to https://gist.github.com/ustun/73321bfcb01a8657e5b8
;; and to https://stackoverflow.com/questions/11613974/how-can-the-shell-command-output-buffer-be-kept-in-the-background
(defun tim-eslint-fix-file ()
  (interactive)
  (message "eslint --fix the file" (buffer-file-name))
  (call-process-shell-command
   (concat "yarn eslint --fix " (buffer-file-name))
   nil "*Shell Command Output*" t
   )
  (revert-buffer t t))


(defun tim-oorr ()
  (interactive)
  (message "will send oorr")
  (shell-command "adb shell input text \"RR\""))

(map! (:map doom-leader-map "SPC" #'save-buffer)
      :n "C-p" #'+ivy/projectile-find-file
      :n "C-w x" #'window-swap-states

      :n "s" #'tim-middle-of-line
      :n "S" #'tim-middle-of-line-backward

      :n "S-<up>" #'tim-go-up-or-create
      ;; :n "C-<up>" #'tim-go-up-or-create
      ;; :n "M-<up>" #'tim-go-up-or-create
      ;; :n "C-k" #'tim-go-up-or-create

      :n "S-<down>" #'tim-go-down-or-create
      ;; :n "C-<down>" #'tim-go-down-or-create
      ;; :n "M-<down>" #'tim-go-down-or-create
      ;; :n "C-j" #'tim-go-down-or-create

      :n "S-<left>" #'tim-go-left-or-create
      ;; :n "C-<left>" #'tim-go-left-or-create
      ;; :n "M-<left>" #'tim-go-left-or-create
      ;; :n "C-h" #'tim-go-left-or-create ;; please do not remap on C-h

      :n "S-<right>" #'tim-go-right-or-create
      ;; :n "C-<right>" #'tim-go-right-or-create
      ;; :n "M-<right>" #'tim-go-right-or-create
      ;; :n "C-l" #'tim-go-right-or-create

      :n "*" #'tim-re-search-forward
      (:map doom-leader-map "*" #'tim-search-only-word)
      (:map doom-leader-map "/" #'tim-search-word)

      (:map doom-leader-map "r" #'tim-delete-and-replace-word)
      ;; Temporary disable because doom map project on this
      (:map doom-leader-map "d" #'tim-kill-word)
      (:map doom-leader-map "p" #'tim-replace-with-paste)
      (:map doom-leader-map "y" #'tim-copy-word)
      (:map doom-leader-map "e" #'counsel-find-file)

      :v "v" #'er/expand-region

      ;; increment / decrement in doom
      :n  "g+"       #'evil-numbers/inc-at-pt
      ;; :n  "g="    #'evil-numbers/inc-at-pt
      ;; :n  "g-"    #'evil-numbers/dec-at-pt
      )


;; taken from
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
(map! :leader
      ;; my goal is to keep doom binding but replace p with d
      (:prefix-map ("x" . "project")))

;; my goal is to allow project/sub-project to works
;; (after! projectile
  ;;   (projectile-register-project-type 'npm '("package.json")
  ;;                                     :compile ""
  ;;                                     :test "yarn test"
  ;;                                     :run "yarn start"
  ;;                                     :test-suffix ".spec")
  ;; (setq projectile-require-project-root nil))
;; to repaire path :
;; M-: (setq-local projectil-project-root "~/grandmgroup/hub-ecla/admin")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; TIPS ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To discover default command :
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/editor/evil/config.el
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/api.org
;; To manage package
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#package-management
;; To find help -> go to discord (link in readme)

;; After updating, please run M-x doom/reload
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; flexible, simple tools for minibuffer completion in Emacs : https://github.com/abo-abo/swiper
;; Ivy, a generic completion mechanism for Emacs.
;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands.
;; Swiper, an Ivy-enhanced alternative to isearch.
;;
;; Counsel has a lot of function with projectile; M-x counsel to see list.
;; Sometimes, I may prefer use simple counsel-* over counsel-projectile-*

;; To get unicode char like λ 👍 🍺 ⚠
;; run M-x counsel-unicode-char

;; C-u M-! inserts the result of the ‘shell-command’

;; reload a file by reading hard drive :
;; M-x revert-buffer

;; Their is ivy, counsel, projectile, workspace
;; gt -> workspace.
;; SPC TAB -> workspace
;; Kill a project/workspace -> SPC TAB d
;; One of my problem was having a workspace at /hub-ecla
;; and another at /hub-ecla/admin
;; projectile does not allow this. Workspace allow it.
;; To do it :
;; SPC TAB n
;; Then swhitch using gt (change tab)

;; Extracted from my old custom.el
;; Maybe I ll have to reinsert this into doom
;; '(web-mode-comment-formats
;;   (quote
;;    (("java" . "/*")
;;     ("javascript" . "//")
;;     ("php" . "/*")
;;     ("css" . "/*"))))
;; '(xterm-mouse-mode t))

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
