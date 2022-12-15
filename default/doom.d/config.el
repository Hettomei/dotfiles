;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;; end of doom config.example.el ;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; "Prefix argument" is SPC u in doom
;; example, in normal mode :
;; press g a -> display info.
;; press SPC u g a -> display extended info.
;;
;; Please do not add variable using easy custom. Or it will be hard to save configuration.

(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-material) ;; problem, we didn't see which text is highlighted
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-spacegrey)

(when (display-graphic-p)
  (toggle-frame-maximized)
  (setq doom-font (font-spec :family "monospace" :size 13)
        doom-variable-pitch-font (font-spec :family "sans"))

  (custom-theme-set-faces! 'doom-one
    '(line-number :foreground "dim gray")
    '(line-number-current-line :foreground "white")
    ;; '(doom-modeline-project-dir :foreground "blue")
    ;; '(doom-modeline-buffer-path   :foreground "blue")
    '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
    '(mode-line :background "black" :height 80)
    '(default :background "#002b36"))

  (custom-theme-set-faces! 'doom-spacegrey
    '(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
    '(mode-line :background "black" :height 80)
    '(default :background "#002b36")))

(custom-set-faces!
  ;; press SPC u g a to know the current face under cursor
  '(font-lock-doc-face :foreground "#ff8800")
  '(font-lock-comment-face :foreground "#ff8800")
  '(org-ellipsis :foreground "#FFFFFF")
  '(whitespace-hspace :foreground "#FF0000" :background "#FFFFFF") ; hard space, non breakable space, used with whitespace.el
  '(whitespace-tab :foreground "#FFFFFF" :background "#000000") ; tab face
  '(corfu-default :background "#000000" :foreground "#FFFFFF"))

;; (unless (display-graphic-p)
;;     (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
;;     (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(setq
 ;; Uncomment this line if you don't like having a prompt that ask to quit
 confirm-kill-emacs nil

 ;; If you intend to use org, it is recommended you change this!
 org-directory "~/org/"
 ;; So the notification stay forever when using org-timer-set-timer
 org-show-notification-timeout 0

 ;; If you want to change the style of line numbers,
 ;; change this to `relative' or t or `nil' to disable it:
 ;; Line numbers are pretty slow all around. The performance boost of
 ;; disabling them outweighs the utility of always keeping them on.
 display-line-numbers-type t

 ;; To autocomplete text, you can M-/
 ;; This variable at nil means "be case sensitive"
 dabbrev-case-fold-search nil

 ;; When done with C-S display a counter
 isearch-lazy-count 1

 ;; Try to disable to see if related with search jump
 ;; Always display 5 lines
 hscroll-margin 10
 ;; auto-hscroll-mode 'current-line
 scroll-margin 5
 ;; Avoid jump when search
 scroll-preserve-screen-position nil

 whitespace-style '(face tabs spaces trailing space-before-tab indentation empty space-after-tab tab-mark space-mark)
 whitespace-display-mappings
 '((space-mark   ?\    [? ]        [? ]) ; space     see here < >
   (space-mark   ?\xA0 [?\xA4]     [?_]) ; hardspace see here < >
   (tab-mark     ?\t   [187 9]   [92 9]) ; tab       see here <	>
   (newline-mark ?\n   [?\xB6 ?\n] [?$ ?\n]); end-of-line <no demo>
   )

 ;; Disable help mouse-overs for mode-line segments (i.e. :help-echo text).
 ;; They're generally unhelpful and only add confusing visual clutter.
 mode-line-default-help-echo nil
 show-help-function nil

 ;; Need to update this BEFORE openning the CSV.
 ;; That strange. I m pretty sure it s because i m bad at emacs
 ;; then open the file
 ;; go into csv-mode if not already done
 ;; SPC-m-a (or csv-align-fields)
 csv-separators '(";" ",")

 ;; Auto create new window when move to inexistant windows
 windmove-create-window t

 ;; Stop asking for which word commes after ``` when editing markdown
 markdown-gfm-use-electric-backquote nil

 ;; Stop at the end of file when no other words are found
 ;; the "error" (instead of nil) prevent emacs to highlight non related region
 isearch-wrap-function (lambda () (error "no more matches"))

 ;; unfo-fu use 'unconstrained mode' when pressing C-g before u or C-r.
 ;; The problem is it also works with ESC. And I press Esc every time.
 ;; So I m often lost with this unconstrained mode.
 ;; This remove unconstrained mode to have a simplistic undo redo
 undo-fu-ignore-keyboard-quit t

 ;; See https://github.com/justbur/emacs-which-key
 which-key-idle-delay 0.2
 which-key-separator " "

 split-width-threshold 22
 ;; When pressing M-x, vertico remember history-length last command, I just want this amount
 history-length 15

 ;; thanks to https://tecosaur.github.io/emacs-config/config.html
 window-combination-resize t ;take new window space from all other windows (not just current)

 company-idle-delay nil
 flycheck-check-syntax-automatically '(save)
 )

;; Thanks to https://tech.toryanderson.com/2022/07/18/stop-find-file-from-ignoring-.git/
;; display .git folder
;; (completion-ignored-extensions nil)

(defun me/dabbrev-use-ALL-buffers (obuff)
  "So I can search in every buffer, including help buffer"
  ;; (message "me/dabbrev-use-ALL-buffers: %s" obuff)
  t
  )

;; By default, dabbrev-friend-buffer-function use dabbrev--same-major-mode-p which is very restricting
(setq dabbrev-friend-buffer-function 'me/dabbrev-use-ALL-buffers)
(defun me/dabbrev-completion ()
  (interactive)
  (minibuffer-with-setup-hook
      'me/add-lazy-flex-search
    ;; thanks to https://emacs.stackexchange.com/questions/60822/how-to-specify-prefix-argument-in-key-binding :
    ;; in doom SPC-u trigger "current-prefix-arg '(4)"
    (let ((current-prefix-arg '(4)))
      (call-interactively #'dabbrev-completion))))

;; thanks to https://people.gnome.org/~federico/blog/bringing-my-emacs-from-the-past.html
;; Let me switch windows with shift-arrows instead of "C-x o" all the time
(windmove-default-keybindings)

;; display blank whitespace non breakable space
(global-whitespace-mode)

(add-to-list 'auto-mode-alist '("\\.bashrcc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.profilee\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))

(defun me/get-file-path ()
  "Get file path even when in dired-mode. Taken from https://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs"
  (if (eq major-mode 'dired-mode)
      (dired-get-filename)
    (or (buffer-file-name) "")))

(defun me/copy-file-name ()
  "Copy the buffer file name."
  (interactive)
  (let ((name (file-name-nondirectory (me/get-file-path))))
    (message "Copied: %s" name)
    (kill-new name)))

(defalias 'copy-file-path '+default/yank-buffer-path)
(defalias 'copy-file-path-relative-to-project '+default/yank-buffer-path-relative-to-project)

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
  "Delete the inner symbol and paste another on it.
   Do not save in register the replaced symbol"
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'symbol)))
    (cond (thing
           (delete-region (car thing) (cdr thing))
           (yank))
          (t
           (forward-char) (me/replace-with-kill-ring)))))

(defun me/search-project-bound-symbol (&optional symbol arg)
  "Search only for symbol under cursor"
  ;; this interactive has been stolen from ~/.emacs.d/modules/config/default/autoload/search.el
  (interactive
   (list (rxt-quote-pcre (or (doom-thing-at-point-or-region) ""))
         current-prefix-arg))
  ;; \b to force word boundaries
  (+vertico/project-search nil (concat "\\b" symbol "\\b")))


(defun me/search-project-bound-function (&optional symbol arg)
  "Search only for symbol as a function under cursor.

In the futur, it should check current minor mode,
so in python it looks for def, in javascript function..."
  ;; this interactive has been stolen from ~/.emacs.d/modules/config/default/autoload/search.el
  (interactive
   (list (rxt-quote-pcre (or (doom-thing-at-point-or-region) ""))
         current-prefix-arg))
  (+vertico/project-search nil (concat "def\\ " symbol)))

(defun me/consult-imenu-symbol-at-point (&optional symbol arg)
  "Search only for symbol under cursor but consult imenu only return headers or function which is great."
  (interactive)
  (minibuffer-with-setup-hook
      'me/add-lazy-flex-search
    (call-interactively #'consult-imenu)))


;; Temporary comment this part that change _ and - as part of word because we can do it
;; based on each mode
;; We can change it by mode with :
;; ----------- disabled part -------
;; or read https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
;; (defun me/improve-word-length ()
;;   "This way, when do a 'e' (evil-forward-word-end) it is better.
;; Even playing with symbol, when inside a string, it becomes a word"
;; (modify-syntax-entry ?_ "w")
;; (modify-syntax-entry ?- "w"))
(modify-syntax-entry ?: ".")
(modify-syntax-entry ?/ ".")

;; (add-hook! 'after-change-major-mode-hook #'me/improve-word-length)
;; ----------- //disabled part -------

;; thanks to https://www.emacswiki.org/emacs/EmacsSyntaxTable :
;; we start from a syntax table
;; we update it and to for each char (after ?) we tell which type it is
;; C-h s to see a table per mode
(add-hook! 'sh-mode-hook (lambda ()
                           (let ((table (make-syntax-table sh-mode-syntax-table)))
                             ;; We tell that : is part of punctuation (the ".").
                             ;; So when I press * when I m on A in "${VAR_ENV:2}" it search for VAR_ENV
                             (modify-syntax-entry ?: "." table)
                             ;; (modify-syntax-entry ?\] "w" table)
                             (set-syntax-table table))
                           ))


(defun me/search-case-sensitive ()
  "Search case Sensitive
it is local to buffer, so we need to change it everytime a mode change"
  (interactive)
  (setq case-fold-search nil
        evil-ex-search-case 'sensitive)
  (message "evil search case is %s , isearch is %s" evil-ex-search-case case-fold-search))

(defun me/search-case-insensitive ()
  "Search case Sensitive
it is local to buffer, so we need to change it everytime a mode change"
  (interactive)
  (setq case-fold-search t
        evil-ex-search-case 'insensitive)
  (message "evil search case is %s , isearch is %s" evil-ex-search-case case-fold-search))

(defun me/change-search-case ()
  "Search case Sensitive
it is local to buffer, so we need to change it everytime a mode change"
  (interactive)
  (catch 'my-early-return
    (if (member major-mode '(minibuffer-inactive-mode minibuffer-mode dired-mode))
        (throw 'my-early-return "this is the short-circuit result of catch"))

    (if (derived-mode-p 'text-mode) ;; works well, but it looks like we always go to minibuffer mode
        ;; So I want to be more precise
        ;; (if (member major-mode '(markdown-mode text-mode org-mode))
        (progn (setq case-fold-search t
                     evil-ex-search-case 'insensitive))
      (progn
        (setq case-fold-search nil
              evil-ex-search-case 'sensitive)))))

;; (message "---> major-mode: %s, evil-ex-search-case: %s, case-fold-search: %s" major-mode evil-ex-search-case case-fold-search)))

(defun me/format-prettify-indent-on-save ()
  "Will prettify on everything except for
sh-mode and gfm-mode (markdown files)"
  (if (not (member major-mode '(sh-mode gfm-mode markdown-mode)))
      (+format/buffer)))

;; If auto formating is annoying :
;; To enable it, just eval it M-:
(add-hook! 'before-save-hook #'me/format-prettify-indent-on-save)
;; (remove-hook! 'before-save-hook #'me/format-prettify-indent-on-save)

(add-hook! 'window-state-change-hook #'me/change-search-case)

;; auto-fill-mode is automatic line break
(remove-hook! 'text-mode-hook #'auto-fill-mode)

;; Can be enabled when you want with SPC-t-w
(remove-hook! 'text-mode-hook #'visual-line-mode)

;; I don't want persistent undo https://github.com/hlissner/doom-emacs/blob/develop/modules/emacs/undo/README.org#disabling-persistent-undo-history
(remove-hook! 'undo-fu-mode-hook #'global-undo-fu-session-mode)

;; (add-hook! 'window-configuration-change-hook 'balance-windows)

(after! evil
  (setq evil-ex-search-case (quote sensitive)
        evil-search-wrap nil
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-cross-lines t
        evil-echo-state nil ; do not display "insert"
        evil-ex-substitute-global t) ; automatic g in :s/aa/bb/g

  ;; when org file is folded, with evil search it does not search inside
  ;; so switch to emacs search
  ;; found at https://github.com/doomemacs/doomemacs/issues/6478#issuecomment-1219582005
  (evil-select-search-module 'evil-search-module 'isearch)

  ;; before this, having "some_var_name", cursor on o, pressing "ciw" it becomes "_var_name"
  ;; now, it properly change all
  (defalias #'forward-evil-word #'forward-evil-symbol)

  (evil-define-motion me/middle-of-line-forward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    :type inclusive
    (goto-char (/ (+ (point) (point-at-eol)) 2)))

  (evil-define-motion me/middle-of-line-backward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    (interactive)
    (goto-char (/ (+ (point) (point-at-bol)) 2)))

  ;; do not repeat these command when use "."
  ;; keep here for demo
  ;; (evil-declare-motion 'me/isearch-repeat-forward)

  )

;; Disable smartparens that automatically completed " with a second " (same for '',() ...)
;; It also do a good job dealing with () movement, see https://smartparens.readthedocs.io/en/latest/
;; (after! smartparens
;; (use-package! smartparens
;;   (smartparens-mode -1)
;;   (smartparens-global-mode -1))

(defun me/stop-smartparens ()
  "This is a workaround because the after! or use-package! or disable-packages!
is overriden by something else."
  (message "Major mode is %s" major-mode)
  (smartparens-mode -1)
  (smartparens-global-mode -1))

(add-hook! 'after-change-major-mode-hook #'me/stop-smartparens)

(defun me/change-pythonpath ()
  (if (and (stringp buffer-file-name)
           (string-match "tableau_de_bord" buffer-file-name))
      (setenv "PYTHONPATH" "/home/etga9120/poleemploi/referentiel_enf/tableau_de_bord/Scripts"))
  (if (and (stringp buffer-file-name)
           (string-match "poleemploi/referentiel_enf/tesi-vm" buffer-file-name))
      (setenv "PYTHONPATH" "/home/etga9120/poleemploi/referentiel_enf/tesi-vm/app"))
  (if (and (stringp buffer-file-name)
           (string-match "poleemploi/referentiel_enf/tkgi" buffer-file-name))
      (setenv "PYTHONPATH" "/home/etga9120/poleemploi/referentiel_enf/tkgi"))
  (if (and (stringp buffer-file-name)
           (string-match "poleemploi/referentiel_enf/tae-api" buffer-file-name))
      (setenv "PYTHONPATH" "/home/etga9120/poleemploi/referentiel_enf/tae-api/src")))

(add-hook! 'python-mode-hook #'me/change-pythonpath)

;; Thanks to https://stackoverflow.com/questions/67091936/how-can-i-disable-web-beautify-errors-from-the-emacs-web-beautify-package
;; Avoid displaying the *format-all-errors* buffer when save python file with syntax error
;;
;;This does not work in config file
;;I tested :
;;- alone without hook
;;- after emacs completely loaded
;;- python hook
;;- flycheck hook
;;
;;the only things that works is when I evaluate it by hand
(add-hook! 'python-mode-hook  (lambda ()
                                (add-to-list 'display-buffer-alist
                                             (cons "\\*format-all-errors\\*"
                                                   (cons 'display-buffer-no-window
                                                         '((allow-no-window . t)))))))

(defun me/insert-random-uuid ()
  (interactive)
  (shell-command "uuidgen" t))

(defun me/oorr ()
  (interactive)
  (message "will send oorr")
  (shell-command "adb shell input text \"RR\""))

(defun me/symbole-at-point-and-lazy-flex ()
  (let ((thing (thing-at-point 'symbol 'no-properties)))
    (if thing
        (insert thing))))

(defun me/add-lazy-flex-search ()
  (move-beginning-of-line nil)
  (insert "~")
  (move-end-of-line nil))

(defun me/add-regex-to-bypass-orderless ()
  "This need to be interactive to work in projectile-map"
  (interactive)
  (self-insert-command 1 ?.)
  (self-insert-command 1 ?+))

;; (defun me/cape-dabbrev ()
;;   (interactive)
;;   (minibuffer-with-setup-hook
;;       'me/add-lazy-flex-search
;;     (call-interactively #'cape-dabbrev)))

(defun me/increase-width-height ()
  (interactive)
  (evil-window-increase-width 20)
  (evil-window-increase-height 10))

(defun me/decrease-width-height ()
  (interactive)
  (evil-window-decrease-width 20)
  (evil-window-decrease-height 10))

(defun me/replace-with-evil ()
  "Will start an evil search and replace with symbol at point"
  (interactive)
  (let* ((thing (thing-at-point 'symbol 'no-properties))
         (escaped-thing (string-replace "/" "\\/" thing)))
    (if thing
        ;; escape / to keep it working with %s/a/b
        (evil-ex (concat "%s/\\<" escaped-thing "\\>/" escaped-thing)))))

(defun me/jump20line ()
  "jump 20 line"
  (interactive)
  (evil-next-line 20))

(defun me/get-column-number-first-char ()
  "Return column number at POINT."
  (save-excursion
    (back-to-indentation)
    (1+ (current-column))))

;; tags: fold indent
(defun me/set-selective-display-dlw (&optional level)
  "Fold text indented same of more than the cursor.

If level is set, set the indent level to LEVEL.

If 'selective-display' is already set to LEVEL,
calling again will unset 'selective-display' by setting it to 0.

Thank you https://stackoverflow.com/a/27749009/1614763"
  (interactive "P")
  (let ((col (me/get-column-number-first-char)))
    (if (eq selective-display col)
        (set-selective-display 0)
      (set-selective-display (or level col)))))

(defvar me/common-url-regexp
  (concat
   "\\b\\(\\(www\\.\\|\\(s?https?\\|ftp\\|file\\|gopher\\|"
   "nntp\\|news\\|telnet\\|wais\\|mailto\\|info\\):\\)"
   "\\(//[-a-z0-9_.]+:[0-9]*\\)?"
   (let ((chars "-a-z0-9_=#$@~%&*+\\/[:word:]")
	 (punct "!?:;.,"))
     (concat
      "\\(?:"
      ;; Match paired parentheses, e.g. in Wikipedia URLs:
      ;; http://thread.gmane.org/47B4E3B2.3050402@gmail.com
      "[" chars punct "]+" "(" "[" chars punct "]+" ")"
      "\\(?:" "[" chars punct "]+" "[" chars "]" "\\)?"
      "\\|"
      "[" chars punct "]+" "[" chars "]"
      "\\)"))
   "\\)")
  "Regular expression that matches URLs.
Copy of variable `browse-url-button-regexp'.
Taken from https://protesilaos.com/codelog/2021-07-24-emacs-misc-custom-commands/")

(defun me/search-occur-urls ()
  "Produce buttonised list of all URLs in the current buffer.
Press C-c RET to open it.
Taken from https://protesilaos.com/codelog/2021-07-24-emacs-misc-custom-commands/"
  (interactive)
  (let ((buf-name (format "*links in <%s>*" (buffer-name))))
    (add-hook! 'occur-hook #'goto-address-mode)
    (occur-1 me/common-url-regexp "\\&" (list (current-buffer)) buf-name)
    (remove-hook 'occur-hook #'goto-address-mode)))


;; Keep evil-snipe but disable 's' mapping
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; (after! flycheck
;;   :config
;;   (setq-default flycheck-disabled-checkers '(python-flake8)))
;;

(use-package! vertico
  :config (setq vertico-cycle nil
                vertico-sort-function 'vertico-sort-history-alpha
                )
  (vertico-mouse-mode))

;; Not working for the moment
;; (use-package! consult
;;   :config (consult-customize
;;            consult-grep consult-ripgrep consult-git-grep :group nil))

;; See call starting wwith cap in map!
;; (use-package! cape)

;; see mapping to gm bellow
(use-package! string-inflection)
(use-package! crosshairs)

(use-package! projectile
  :config
  ;; fd is fast. No need to cache or you have to SPC-x i to invalidate it multiple times
  (setq projectile-enable-caching nil))

(defun me/dired-view-file ()
  (interactive)
  (dired-view-file)
  (local-set-key (kbd "<f6>") 'View-quit))

(defun me/insert-line-before-and-3-backtick ()
  (interactive)
  (save-excursion
    (back-to-indentation)
    (insert "```\n")))

(defun me/insert-line-after-and-3-backtick ()
  (interactive)
  (save-excursion
    (forward-line 1)
    (back-to-indentation)
    (insert "```\n")))

;; taken from
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
(map!
 ;; needf to invert + and =
 ;; and also need to be consistant because C-- was on text-scale-decrease
 :n "C-+" #'doom/increase-font-size
 :n "C--" #'doom/decrease-font-size
 :n "C-=" #'doom/reset-font-size

 :n "za" #'me/set-selective-display-dlw

 :n "C-w x" #'window-swap-states

 :n "^" #'doom/backward-to-bol-or-indent ;; smarter, go at 0 on second press
 :n "$" #'doom/forward-to-last-non-comment-or-eol
 :n "C-p" #'projectile-find-file
 :n "S-C-p" #'projectile-find-file-dwim ;; try to be smart to open file
 :n "C-M-p" #'doom/find-file-in-other-project ;; when you want to read source code of another project easily
 ;; :n ")" #'me/jump20line
 :n "M-y" #'consult-yank-from-kill-ring

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

 ;; Completion with vertico + cape
 ;; :i  "C-n"      #'me/cape-dabbrev
 ;; :i  "C-p"      #'dabbrev-expand
 ;; :i  "C-x C-j"  #'cape-keyword
 ;; :i  "C-x C-l"  #'cape-line
 ;; :i  "C-x C-f"  #'cape-file
 ;;
 ;; completion with company - too cumbersome but I keep one in case
 :i  "C-SPC" #'company-complete-common-or-cycle ;; to try to find code related completion
 ;;
 ;; completion hippi expand
 ;; I want to see in a popup or minibuffer, so not really using it
 :i  "C-p"   #'hippie-expand ;; maybe we can try it sometimes
 ;;
 ;; completion dabbrev
 ;; :i  "C-n" #'dabbrev-completion ;; we need interactive mode to enable "all buffers"
 :i  "C-n" #'me/dabbrev-completion
 ;; to complete the next word like vim C-x C-n, you must first complete the current word, then space, then C-p

 ;; in markdown, ``` will create a block of code.
 ;; It s too long.
 ;; Also, two ££ to be consistent because in french keyboard ` needs to be pressed 2 times
 :n  "££" #'me/insert-line-before-and-3-backtick
 :n  "`" #'me/insert-line-after-and-3-backtick

 "<f5>" #'me/oorr ;; needed to restart android react app
 "<f9>" #'python-pytest

 ;; can press shift Ctrl V like in vim
 :i "S-C-v" #'evil-paste-after

 ;; :map evil-ex-search-keymap
 ;; :i "S-C-v" #'evil-paste-after # not working

 ;; After a doom upgrade, I need to add this 'general-override-mode-map
 ;; to make it works
 :map general-override-mode-map
 :n "s" #'me/middle-of-line-forward
 :n "S" #'me/middle-of-line-backward

 :map evil-window-map
 ;; :g is for global, because when :n doesn't work
 :g  "+" 'me/increase-width-height
 :g  "-" 'me/decrease-width-height

 :map markdown-mode-map
 :n "za" #'markdown-cycle
 ;; trouvé grace à C-B k dans le minibuffer
 ;; :map minibuffer-local-filename-completion-map
 :map minibuffer-mode-map
 "S-SPC" #'me/add-regex-to-bypass-orderless

 ;; Do not change my changing window S-arrow
 ;; If you want to act on org, use S-C-{hjkl} (shift - control and vim's hjkl)
 ;; Sometimes S-C-h brings the doc, sometimes it works, keep searching
 :map org-mode-map
 "<S-up>" nil
 "<S-down>" nil
 "<S-left>" nil
 "<S-right>" nil

 ;; just press f6 repeateadly to open and close file in dired. A preview.
 :map dired-mode-map
 "<f6>" #'me/dired-view-file

 ;; :map csv-mode-map
 ;; :n "<left>" #'csv-backward-field
 ;; :n "<right>" #'csv-forward-field

 :map doom-leader-file-map
 "R" #'me/simple-rename-file-and-buffer

 ;; in this mode when pressing / in evil
 :map isearch-mode-map
 "<up>" 'isearch-ring-retreat ; Because of this line, 'down' automagically works
 "<left>" 'left-char ; Because of this line, 'right' automagically works

 :leader
 :desc "Save file" "SPC" #'save-buffer

 :desc "Search for symbol in project" "*" #'me/search-project-bound-symbol
 ;; recherche dans le projet sans etre limité au symbol boundary
 ;; "URL" trouvera "coucou_URL_toto"
 :desc "Search in project no word boundaries" "/" #'+default/search-project-for-symbol-at-point

 :desc "Delete and go insert" "r" #'me/replace-at-point
 :desc "Kill symbol" "d" #'me/kill-at-point
 :desc "Replace with killed" "p" #'me/replace-with-kill-ring

 :desc "Copy symbol" "y" #'me/copy-symbol
 :desc "Copy and append symbol" "Y" #'me/copy-append-symbol

 :desc "Select file" "e" #'find-file
 :desc "Query replace symbol" "%" #'me/replace-with-evil
 :desc "Display functions or header or ... try it" "j" #'me/consult-imenu-symbol-at-point
 :desc "Search functions through the codebase" "J" #'me/search-project-bound-function

 ;; my goal is to keep doom binding but replace p with x
 ;; :prefix-map should not be use in private config says the doc ... I don t know
 (:prefix-map ("x" . "project")))

;; This is linked to map!
;; Because I changed SPC f R, I need a way to update the "which key" text
(general-define-key
 :prefix "SPC f"
 :keymaps 'normal
 ;; bind nothing but give SPC f R a description for which-key
 "R" '(:ignore t :which-key "Rename file"))

;; default modeline :
;; (doom-modeline-def-modeline 'main
;;   (bar workspace-name window-number modals matches buffer-info remote-host buffer-position word-count parrot selection-info)
;;   (objed-state misc-info persp-name battery grip irc mu4e gnus github debug repl lsp minor-modes input-method indent-info buffer-encoding major-mode process vcs checker))

(after! doom-modeline
  ;; TODO : cannot find a way to print total line number
  ;; (setq doom-modeline-percent-position nil)
  ;; (setq global-mode-string '("add info here"))
  (doom-modeline-def-modeline 'main
    ;; left part
    '(bar matches buffer-info buffer-position word-count selection-info)
    ;; right part
    ;; misc-info is what is present in global-mode-string
    '(misc-info debug repl lsp minor-modes input-method indent-info buffer-encoding major-mode process checker)))

(after! org
  (setq org-agenda-files '("~/org" "~/poleemploi/org")
        org-log-done 'time
        org-ellipsis " ⤵"
        org-agenda-span 30))

;; Instead of
;; (doom-modeline-def-modeline 'main ...)
;; I wanted
;; (doom-modeline-def-modeline 'tim ...)
;; (doom-modeline-set-modeline 'tim t)
;; But does not work. I think some hook always change modeline to main


;; Need to create it first :
;; open your emacs,
;; create the session you love
;; then SPC q S
(defun me/load-session ()
  (when (display-graphic-p)
    ;; (if (not buffer-file-name)
    ;; (doom/load-session "~/.emacs.d/.local/etc/workspaces/start-config")
    (doom/load-session "~/.emacs.d/.local/etc/workspaces/me-start")
    ;; (doom/load-session "~/.emacs.d/.local/etc/workspaces/formation-react")
    ))

(defun me/run-after-emacs-is-loaded ()
  (me/load-session)
  ;; remove this info from modeline
  (size-indication-mode -1))


(add-hook! 'window-setup-hook #'me/run-after-emacs-is-loaded)

(defun me/code-en-html ()
  (interactive)
  (message "Pour afficher le code dans le navigateur, faire :
M-x htmlize-buffer
M-x browse-url-of-buffer
(or C-c C-v if you are in html-mode)
Si le copier coller ne marche pas avec les couleurs, ouvrir le fichier temporaire dans chrome"))

(defun me/simple-rename-file-and-buffer (name)
  "Apply NAME to current file and rename its buffer.
Do not try to make a new directory or anything fancy.

taken from https://protesilaos.com/codelog/2021-07-24-emacs-misc-custom-commands/"
  (interactive
   (list (read-string "Rename current file: " (buffer-file-name))))
  (let ((file (buffer-file-name)))
    (if (vc-registered file)
        (vc-rename-file file name)
      (rename-file file name))
    (set-visited-file-name name t t)))

(defun me/nxml-where ()
  "Display the hierarchy of XML elements the point is on as a path.
Taken at https://www.emacswiki.org/emacs/NxmlMode#toc11"
  (interactive)
  (let ((path nil))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (< (point-min) (point)) ;; Doesn't error if point is at beginning of buffer
                    (condition-case nil
                        (progn
                          (nxml-backward-up-element) ; always returns nil
                          t)
                      (error nil)))
          (setq path (cons (xmltok-start-tag-local-name) path)))
        (if (called-interactively-p t)
            (message "/%s" (mapconcat 'identity path "/"))
          (format "/%s" (mapconcat 'identity path "/")))))))


(defun me/yaml-indentation-level (s)
  (if (string-match "^ " s)
      (+ 1 (me/yaml-indentation-level (substring s 1)))
    0))

(defun me/yaml-current-line ()
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun me/yaml-clean-string (s)
  (let* ((s (replace-regexp-in-string "^[ -:]*" "" s))
         (s (replace-regexp-in-string ":$" "" s)))
    s))

(defun me/yaml-not-blank-p (s)
  (string-match "[^[:blank:]]" s))

(defun me/yaml-path-to-point ()
  (save-excursion
    (let* ((line (me/yaml-current-line))
           (level (me/yaml-indentation-level line))
           result)
      (while (> (point) (point-min))
        (beginning-of-line 0)
        (setq line (me/yaml-current-line))

        (let ((new-level (me/yaml-indentation-level line)))
          (when (and (me/yaml-not-blank-p line)
                     (< new-level level))

            (setq level new-level)
            (setq result (push (me/yaml-clean-string line) result)))))

      (mapconcat 'identity result " => "))))

(defun me/yaml-show-path-to-point ()
  (interactive)
  (message (me/yaml-path-to-point)))

(defun me/evil-ex-start-search-with-region-string ()
  "In visual mode pressing '/' will start search immediately"
  (let ((selection (with-current-buffer (other-buffer (current-buffer) 1)
                     (when (evil-visual-state-p)
                       (let ((selection (buffer-substring-no-properties (region-beginning)
                                                                        (1+ (region-end)))))
                         (evil-normal-state)
                         selection)))))
    (when selection
      (evil-ex-remove-default)
      (insert selection)
      (evil-ex-search-activate-highlight (list selection
                                               evil-ex-search-count
                                               evil-ex-search-direction)))))
(advice-add #'evil-ex-search-setup :after #'me/evil-ex-start-search-with-region-string)

(defun me/save-and-kill-this-buffer()
  "Save and quits the buffer"
  (interactive)
  (save-buffer)
  (+workspace/close-window-or-workspace))

;; stolen and adapted from https://github.com/kavulox/emacs
(evil-ex-define-cmd "wq" 'me/save-and-kill-this-buffer)
(evil-ex-define-cmd "q" '+workspace/close-window-or-workspace)

;; taken from internet. Can t remember where. Thank you people.
(defun me/show-projects ()
  "Display a new page that list project, and open it when press ENTER"
  (interactive)
  (switch-to-buffer "*projects*")
  (org-mode)
  (insert "#+TITLE: Projects\n\n")
  (dolist (project (projectile-relevant-known-projects))
    (insert (concat "* " project " [[" project "]] " "\n")))
  (goto-char (point-min)))
;; (me/show-projects)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; TIPS ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To convert a csv into an org table :
;;
;; Domaine ENF;TESI Disponibles;TESI Non disponibles;PKS Disponibles ;PKS Non disponibles;PAS Disponibles ;PAS Non disponibles
;; Architecture;1;0;1;0;2;0   ( le 2 dans cette ligbe n'est as bon)
;; Exploitabilite;15;0;14;1;13;2
;;
;; Select the region
;; then
;; SPC-; (or M-:) and write :
;; (org-table-convert-region (region-beginning) (region-end) ";")


;; To discover default command :
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/editor/evil/config.el
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/api.org
;; To manage package
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#package-management
;; To find help -> go to discord (link in readme)


;; https://github.com/abo-abo/swiper : flexible, simple tools for minibuffer completion in Emacs
;; Ivy, a generic completion mechanism for Emacs.
;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands.
;; Swiper, an Ivy-enhanced alternative to isearch.
;;
;; Counsel has a lot of function with projectile; M-x counsel to see list.
;; Sometimes, I may prefer use simple counsel-* over counsel-projectile-*

;; To get unicode char like λ 👍 🍺 ⚠ 🥊 💙 💔 🖤 💓 🎔 💚 💗 💟 💘 💝 ❤ 🧡 🂱 💜 💞 💖 💕:
;; run M-x insert-char
;; run SPC-i u ;unicode
;; run SPC-i e ;emoji

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


;; how to let a shell command updating a file :
;; Thanks to https://gist.github.com/ustun/73321bfcb01a8657e5b8
;; and to https://stackoverflow.com/questions/11613974/how-can-the-shell-command-output-buffer-be-kept-in-the-background

;; load all project :
;; #1 : set var
;; (setq projectile-project-search-path '(("~/poleemploi/" . 3)))
;; (setq projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1)))
;;
;; #2 : load
;; M-x projectile-discover-projects-in-search-path

;; pour voir en gros / presentation / zoom / stream / teams
;; M-x doom-big-font-mode
