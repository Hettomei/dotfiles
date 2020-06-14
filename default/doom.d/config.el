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

;; (if (display-graphic-p)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-material) ;; problem, we didn't see which text is highlighted
;; (setq doom-theme 'doom-solarized-dark))
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers,
;; change this to `relative' or t or `nil' to disable it:
;; Line numbers are pretty slow all around. The performance boost of
;; disabling them outweighs the utility of always keeping them on.
(setq display-line-numbers-type nil)
;; To autocomplete text, you can M-/
;; This variable at nil means "be case sensitive"
(setq dabbrev-case-fold-search nil)


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
  ;; '(doom-modeline-project-dir :foreground "blue")
  ;; '(doom-modeline-buffer-path   :foreground "blue")
  ;; '(mode-line-inactive :background "dim gray" :height 80)
  ;; '(mode-line :background "light blue" :height 80))
  '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
  '(mode-line :background "black" :height 80))


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
      ;; auto-hscroll-mode 'current-line
      scroll-margin 5
      ;; Avoid jump when search
      scroll-preserve-screen-position nil
      whitespace-style '(face empty trailing)

      ;; Disable help mouse-overs for mode-line segments (i.e. :help-echo text).
      ;; They're generally unhelpful and only add confusing visual clutter.
      mode-line-default-help-echo nil
      show-help-function nil)

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

(defun tim/delete-and-go-insert ()
  "Delete the word and go in insert mode. Equivalent to ciw without saving in register"
  (interactive)
  (forward-word)
  (backward-word)
  (delete-region (point) (progn (forward-word) (point)))
  (evil-insert 1))

;; taken at https://github.com/wandersoncferreira/vim-mindset-apply-emacs
(defun tim/kill-inner-word ()
  "Kills the entire word your cursor is in. Equivalent to diw in vim."
  (interactive)
  (forward-word)
  (backward-word)
  (kill-word 1))

(defun tim/copy-word ()
  "Copy the word. Same as yiw"
  (interactive)
  (save-excursion
    (forward-word)
    (backward-word)
    (copy-region-as-kill (point) (progn (forward-word) (point)))
    (message "kill: %s" (car kill-ring))))

(defun tim/replace-with-kill-ring ()
  "Delete the inner word and paste another on it. Do not save in register the replaced word"
  (interactive)
  (save-excursion
    (forward-word)
    (backward-word)
    (delete-region (point) (progn (forward-word) (point)))
    (yank)))

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

(defun tim/search-only-word ()
  "Search only for word under cursor"
  (interactive)
  (let ((counsel-rg-base-command (append (butlast counsel-rg-base-command) '("-w" "--case-sensitive" "%s"))))
    (call-interactively '+default/search-project-for-symbol-at-point)))

;; We can change it by mode with :
;; (add-hook! 'python-mode-hook (modify-syntax-entry ?_ "w"))
;; or read https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
(defun improve-word-length ()
  "This way, when do a tim/copy-word on entry, it copies 'modify-syntax-entry'"
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?- "w"))

(add-hook 'after-change-major-mode-hook #'improve-word-length)

;; auto-fill-mode is automatic line break
(remove-hook! 'text-mode-hook #'auto-fill-mode)

;; I don't want persistent undo https://github.com/hlissner/doom-emacs/blob/develop/modules/emacs/undo/README.org#disabling-persistent-undo-history
(remove-hook 'undo-fu-mode-hook #'global-undo-fu-session-mode)

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

  (evil-define-motion tim-re-search-forward ()
    "Fix bug when you are on the last search and it tells 'nothing is found'... which is wrong"
    :jump t
    :type exclusive
    (interactive)
    (let ((evil-search-wrap t)) ;; temporary override wrap
      (call-interactively 'evil-ex-search-word-forward))))


;; disable smartparens that automatically completed " with a second " (same for ''())
;; It also do a good job dealing with () movement, see https://smartparens.readthedocs.io/en/latest/
;; update: cannot disable in ./packages.el because it is a core package. Need to disable hook.
(after! smartparens
  (smartparens-mode -1)
  (smartparens-global-mode -1))

(defun me/stop-smartparens ()
  "This is a workaround because the after! is overriden by something else."
  (smartparens-mode -1)
  (smartparens-global-mode -1))

;; # temporary workaround
(add-hook 'after-change-major-mode-hook #'me/stop-smartparens)

;; Try to disable it. Not working
;; (use-package! smartparens
;;   :config
;;   (smartparens-global-mode -1))

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

(defun tim-insert-random-uuid ()
  (interactive)
  (shell-command "uuidgen" t))

;; complete anything http://company-mode.github.io/
(use-package! company
  :config
  ;; disable auto popup after x seconds
  (setq company-idle-delay nil
        ;; allow code completion inside comments and string
        company-dabbrev-code-everywhere t
        ;; press M-<digit> to select a given number
        company-show-numbers t
        ;; allow code completion matching all buffer
        company-dabbrev-code-other-buffers 'all)
  ;; you can do C-s to perform a search inside completion :)
  (define-key company-active-map (kbd "<tab>") #'company-complete-common)
  ;; vim mode !!!!!! thank you.
  (company-tng-configure-default))

(use-package! ivy
  :bind (:map ivy-minibuffer-map
         ("C-p" . ivy-previous-history-element))
  ;; ("S-<right>" . tim-ivy-find-and-open-rightr))
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

(after! counsel
  :config
  ;; Thanks to https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-counsel.el
  ;; the --glob is to see .* file that are versionned BUT NOT .git folder
  (setq counsel-rg-base-command (append (butlast counsel-rg-base-command) '("--hidden" "--glob=!.git" "%s"))))

;; I don't want to quit insert mode with jk : remove
(after! evil-escape
  :config
  (setq evil-escape-key-sequence nil))

(after! flycheck
  :config
  (setq-default flycheck-disabled-checkers '(python-flake8)))

(after! org
  :config
  ;; Do not change my changing window S-arrow
  ;; If you want to act on org, use S-C-{hjkl} (shift - control and vim's hjkl)
  ;; Sometimes S-C-h brings the doc, sometimes it works, keep searching
  (define-key org-mode-map (kbd "<S-up>") nil)
  (define-key org-mode-map (kbd "<S-down>") nil)
  (define-key org-mode-map (kbd "<S-left>") nil)
  (define-key org-mode-map (kbd "<S-right>") nil))

(use-package! egg-timer)
(use-package! string-inflection)

;; Thanks to https://gist.github.com/ustun/73321bfcb01a8657e5b8
;; and to https://stackoverflow.com/questions/11613974/how-can-the-shell-command-output-buffer-be-kept-in-the-background
(defun tim-eslint-fix-file ()
  (interactive)
  (message "eslint --fix the file" (buffer-file-name))
  (call-process-shell-command
   (concat "yarn eslint --fix " (buffer-file-name))
   nil "*Shell Command Output*" t)
  (revert-buffer t t))

;; (add-hook! 'after-save-hook #'tim-eslint-fix-file)
;;
;; To enable it, just eval it M-:
;; (add-hook! 'before-save-hook #'+format/buffer)
;; (remove-hook! 'before-save-hook #'+format/buffer)


(defun tim-oorr ()
  (interactive)
  (message "will send oorr")
  (shell-command "adb shell input text \"RR\""))

(map! (:map doom-leader-map "SPC" #'save-buffer)
      :n "C-p" #'+ivy/projectile-find-file
      :n "C-w x" #'window-swap-states

      :n "s" #'tim-middle-of-line
      :n "S" #'tim-middle-of-line-backward

      :n "*" #'tim-re-search-forward
      :n "^" #'doom/backward-to-bol-or-indent ;; smarter, go at 0 on second press
      :n "$" #'doom/forward-to-last-non-comment-or-eol
      (:map doom-leader-map "*" #'tim/search-only-word)
      (:map doom-leader-map "/" #'+default/search-project-for-symbol-at-point)

      (:map doom-leader-map "r" #'tim/delete-and-go-insert)
      (:map doom-leader-map "d" #'tim/kill-inner-word)
      (:map doom-leader-map "p" #'tim/replace-with-kill-ring)
      (:map doom-leader-map "y" #'tim/copy-word)
      (:map doom-leader-map "e" #'counsel-find-file)

      ;; press v multiple time to expand region
      :v "v" #'er/expand-region

      ;; switch from camelCase snake_case kebab-case ...
      ;; see https://github.com/akicho8/string-inflection
      ;; why gm ? because available and crm cause problem with "c"
      :n "gm" #'string-inflection-all-cycle

      ;; increment / decrement in doom
      :n  "g+" #'evil-numbers/inc-at-pt
      ;; :n  "g="    #'evil-numbers/inc-at-pt
      ;; :n  "g-"    #'evil-numbers/dec-at-pt
      :i  "C-n" #'+company/dabbrev
      :i  "C-p" #'+company/dabbrev

      ;; taken from
      ;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
      ;; my goal is to keep doom binding but replace p with d
      :leader
      (:prefix-map ("x" . "project")))

;; Auto create new window
(setq windmove-create-window t)
;; thanks to https://people.gnome.org/~federico/blog/bringing-my-emacs-from-the-past.html
;; Let me switch windows with shift-arrows instead of "C-x o" all the time
(windmove-default-keybindings)

(setq evil-cross-lines t)

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
