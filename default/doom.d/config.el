;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
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

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package!'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; "Prefix argument" is SPC u in doom
;; example, in normal mode :
;; press g a -> display info.
;; press SPC u g a -> display extended info.
;;
;; Please do not add variable using easy custom. Or it will be hard to save configuration.

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Timothée GAUTHIER"
      user-mail-address "timothee.gauthier@consertotech.pro")

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
  '(font-lock-comment-face :foreground "#ff8800"))

;; (unless (display-graphic-p)
;;     (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
;;     (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(setq
 ;; Uncomment this line if you don't like having a prompt that ask to quit
 confirm-kill-emacs nil

 ;; If you intend to use org, it is recommended you change this!
 org-directory "~/org/"

 ;; If you want to change the style of line numbers,
 ;; change this to `relative' or t or `nil' to disable it:
 ;; Line numbers are pretty slow all around. The performance boost of
 ;; disabling them outweighs the utility of always keeping them on.
 display-line-numbers-type nil

 ;; To autocomplete text, you can M-/
 ;; This variable at nil means "be case sensitive"
 dabbrev-case-fold-search nil

 ;; Search case Sensitive; TODO : need to check what change this value
 case-fold-search nil

 ;; When done with C-S display a counter
 isearch-lazy-count 1

 ;; Try to disable to see if related with search jump
 ;; Always display 5 lines
 hscroll-margin 10
 ;; auto-hscroll-mode 'current-line
 scroll-margin 5
 ;; Avoid jump when search
 scroll-preserve-screen-position nil

 ;; whitespace-style '(face empty trailing)
 whitespace-style '(face tabs spaces trailing space-before-tab indentation empty space-after-tab tab-mark)

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
 windmove-create-window t)

;; thanks to https://people.gnome.org/~federico/blog/bringing-my-emacs-from-the-past.html
;; Let me switch windows with shift-arrows instead of "C-x o" all the time
(windmove-default-keybindings)



(global-whitespace-mode)

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
    (message "current-kill: %s" name)
    (kill-new name)))

(defun tim/replace-at-point ()
  "Delete the word and go in insert mode. Equivalent to ciw without saving in register"
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'word)))
    (cond (thing
           (delete-region (car thing) (cdr thing))
           (evil-insert 1))
          (t
           (forward-char) (tim/replace-at-point)))))

(defun tim/kill-at-point ()
  "Kills the word at point."
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'word)))
    (kill-region (car thing) (cdr thing))
    (message "current-kill: %s" (current-kill 0 'do-not-move))))

(defun tim/copy-symbol ()
  "Copy the symbol at point. Move forward if nothing found."
  (interactive)
  (let ((thing (thing-at-point 'symbol)))
    (cond (thing
           (kill-new thing) (message "current-kill: %s" thing))
          (t
           (forward-char) (tim/copy-symbol)))))

(defun tim/copy-append-symbol ()
  "Copy the symbol at point. Move forward if nothing found."
  (interactive)
  (let ((thing (thing-at-point 'symbol 'no-properties)))
    (cond (thing
           (kill-append (concat " " thing) nil) (message "current-kill: %s" (current-kill 0 'do-not-move)))
          (t
           (forward-char) (tim/copy-append-symbol)))))

(defun tim/replace-with-kill-ring ()
  "Delete the inner word and paste another on it. Do not save in register the replaced word"
  (interactive)
  (let ((thing (bounds-of-thing-at-point 'word)))
    (cond (thing
           (delete-region (car thing) (cdr thing))
           (yank))
          (t
           (forward-char) (tim/replace-with-kill-ring)))))

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

(defun tim/search-project-bound-symbol ()
  "Search only for word under cursor"
  (interactive)
  ;; ivy-case-fold-search-default var change the params passed through counsel-rg-base-command
  ;; so it override --case-sensitive. But setting it as always, and we mess the search file...
  (let ((ivy-case-fold-search-default nil)
        (counsel-rg-base-command (append (butlast counsel-rg-base-command) '("-w" "%s"))))

    (call-interactively '+default/search-project-for-symbol-at-point)))


(defun tim/company-dabbrev-select-next ()
  "display popup AND select first one"
  (interactive)
  (call-interactively '+company/dabbrev)
  (call-interactively 'company-select-next))
;; # Ensuite au pres sur espace, selecte et ajoute espace

(defun tim/company-dabbrev-select-previous ()
  "display popup and select first one"
  (interactive)
  (call-interactively '+company/dabbrev)
  (call-interactively 'company-select-previous))

(defun tim/company-complete-selection ()
  "select what is showed and add a space"
  (interactive)
  (call-interactively 'company-complete-selection)
  (insert " "))

;; We can change it by mode with :
;; (add-hook! 'python-mode-hook (modify-syntax-entry ?_ "w"))
;; or read https://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
(defun improve-word-length ()
  "This way, when do a 'e' (evil-forward-word-end) it is better.
Even playing with symbol, when inside a string, it becomes a word"
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?- "w"))

(add-hook 'after-change-major-mode-hook #'improve-word-length)

;; auto-fill-mode is automatic line break
(remove-hook! 'text-mode-hook #'auto-fill-mode)

;; Can be enabled when you want with SPC-t-w
(remove-hook! 'text-mode-hook #'visual-line-mode)

;; I don't want persistent undo https://github.com/hlissner/doom-emacs/blob/develop/modules/emacs/undo/README.org#disabling-persistent-undo-history
(remove-hook 'undo-fu-mode-hook #'global-undo-fu-session-mode)
; (add-hook 'window-configuration-change-hook 'balance-windows)

(after! evil
  (setq evil-ex-search-case (quote sensitive)
        evil-search-wrap nil
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-cross-lines t
        evil-search-module 'isearch ; Try it, I can't find the difference on internet
        evil-ex-substitute-global t ; automatic g in :s/aa/bb/g
        case-fold-search nil) ;; always changed by something else. Need to investigate

  (evil-define-motion tim/middle-of-line-forward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    :type inclusive
    (goto-char (/ (+ (point) (point-at-eol)) 2)))

  (evil-define-motion tim/middle-of-line-backward ()
    "Put cursor at the middle point of the line. try to mimic vim-skip"
    (interactive)
    (goto-char (/ (+ (point) (point-at-bol)) 2)))

  (evil-define-motion tim/re-search-forward ()
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

(defun me/change-pythonpath ()
  (if (and (stringp buffer-file-name)
           (string-match "tableau_de_bord" buffer-file-name))
      (setenv "PYTHONPATH" "/home/etga9120/poleemploi/referentiel_enf/tableau_de_bord/Scripts")))

(add-hook 'python-mode-hook #'me/change-pythonpath)

;; Try to disable it. Not working
;; (use-package! smartparens
;;   :config
;;   (smartparens-global-mode -1))

(defun tim/insert-random-uuid ()
  (interactive)
  (shell-command "uuidgen" t))

;; Ugly hack :
;; What I want is to Shift arrow, then it open the selection on a new splitted window (up left right, down)
(defun tim/ivy-down-other ()
  (interactive)
  (ivy-exit-with-action #'tim/ivy-down-exit))

(defun tim/ivy-left-other ()
  (interactive)
  (ivy-exit-with-action #'tim/ivy-left-exit))

(defun tim/ivy-right-other ()
  (interactive)
  (ivy-exit-with-action #'tim/ivy-right-exit))

(defun tim/ivy-down-exit (ivy-body)
  (split-window-below)
  (other-window 1)
  (tim/reuse-open-goto-line ivy-body))

(defun tim/ivy-left-exit (ivy-body)
  (split-window-right)
  (tim/reuse-open-goto-line ivy-body))

(defun tim/ivy-right-exit (ivy-body)
  (split-window-right)
  (other-window 1)
  (tim/reuse-open-goto-line ivy-body))


;; Thanks to
;; https://github.com/abo-abo/swiper/blob/master/doc/ivy.org#actions and
;; https://www.reddit.com/r/emacs/comments/efg362/ivy_open_selection_vertically_or_horizontally/
(defun tim/reuse-open-goto-line (ivy-body)
  (message "reuse-open-goto-line ivy-body: %s" ivy-body)
  (let* ((tim/list (split-string ivy-body ":"))
         (file (car tim/list))
         (tim/number (car (cdr tim/list))))

    (condition-case err
        (counsel-projectile-find-file-action file)
      (void-function ; <- that s the error handler name
       (message "open fail with projectile, try find-file. Error was: %s" err)
       (find-file file)))
    ;; Thanks to https://stackoverflow.com/questions/3139970/open-a-file-at-line-with-filenameline-syntax
    (when tim/number
      ;; goto-line is for interactive use
      (goto-char (point-min))
      (forward-line (1- (string-to-number tim/number))))))
  ;; (ivy-resume)) ; It s strange but ivy-resume here change the way that 'ENTER' or ivy-done works afterwards
  ;; Try, as a workaround , in a timer ; no luck
  ;; (run-with-timer 0.1 nil 'ivy-resume))

(defun tim/oorr ()
  (interactive)
  (message "will send oorr")
  (shell-command "adb shell input text \"RR\""))

(defun tim/increase-width-height ()
  (interactive)
  (evil-window-increase-width 20)
  (evil-window-increase-height 10))

(defun tim/decrease-width-height ()
  (interactive)
  (evil-window-decrease-width 20)
  (evil-window-decrease-height 10))

(defun tim/isearch-forward-symbol-at-point ()
  (interactive)
  (let ((case-fold-search nil))
    (call-interactively 'isearch-forward-symbol-at-point)
    (call-interactively 'isearch-exit)
    (call-interactively 'isearch-repeat-forward)))

(defun tim/iisearch ()
  (interactive)
  (let ((case-fold-search nil))
    (isearch-forward-regexp nil 1)
    (isearch-yank-string "point")
    (isearch-exit)
    (isearch-repeat-forward)))

;; Taken at https://www.gnu.org/software/emacs/manual/html_node/eintr/simplified_002dbeginning_002dof_002dbuffer.html
(defun tim/simplified-beginning-of-buffer ()
  "Move point to the beginning of the buffer;
     leave mark at previous position."
  (interactive)
  (push-mark)
  (goto-char (point-min)))

;; From https://www.reddit.com/r/emacs/comments/ikgfxd/weekly_tipstricketc_thread/
;; (defun tim/query-replace ()
;;   "Populate minibuffer with symbol at point"
;;   (interactive)
;;   (when-let ((s (thing-at-point 'symbol 'no-property)))
;;     (minibuffer-with-setup-hook
;;         (lambda ()
;;           (insert s)
;;           (run-at-time 0 nil #'exit-minibuffer))
;;       (call-interactively #'query-replace))))


(defun tim/query-replace ()
  "Populate minibuffer with symbol at point"
  (interactive)
  (when-let ((s (thing-at-point 'symbol 'no-property)))
    (let ((to (read-string (concat "Replace delimited |" s "| with: ") s)))
      (save-excursion
        (query-replace s to 'delimited (point-min) (point-max) nil nil)
        ))))


(defun tim/isearch-forward-word-at-point ()
  "Reset current isearch to a word-mode search of the word under point."
  (interactive)
  (setq isearch-string ""
        isearch-message ""
        case-fold-search nil)
  (tim/copy-symbol)
  (isearch-yank-kill)
  (isearch-exit)
  (isearch-repeat-forward))

;; complete anything http://company-mode.github.io/
(use-package! company
  :config
  ;; disable auto popup after x seconds
  (setq company-idle-delay nil
        ;; allow code completion inside comments and string
        company-dabbrev-code-everywhere t
        ;; press M-<digit> to select a given number
        company-show-numbers t
        ;; Go back to first item
        company-selection-wrap-around t
        ;; allow code completion matching all buffer
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-other-buffers 'all)
  )
  ;; vim mode !!!!!! thank you.
  ;; (company-tng-configure-default))

(use-package! ivy
  :bind (:map ivy-minibuffer-map
         ("C-p" . ivy-previous-history-element)
         ("<S-down>" . tim/ivy-down-other)
         ;; no up to avoid changing buffer problems
         ("<S-left>" . tim/ivy-left-other)
         ("<S-right>" . tim/ivy-right-other))
  :config (setq ivy-wrap nil
           ivy-count-format "%d/%d "
           ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-cd-selected
           ivy-re-builders-alist '((t . ivy--regex-plus)))
           ;; Default doom emacs was :
           ;; ((counsel-rg . ivy--regex-plus)
           ;;  (swiper . ivy--regex-plus)
           ;;  (swiper-isearch . ivy--regex-plus)
           ;;  (t . ivy--regex-ignore-order)))
  ;; Display on top left something like [3] to tell you are 3 recursing minibuffer depth
  (minibuffer-depth-indicate-mode 99))


;; Keep evil-snipe but disable 's' mapping
(after! evil-snipe
  (evil-snipe-mode -1))

(use-package! counsel
  :config
  ;; Thanks to https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-counsel.el
  ;; the --glob is to see .* file that are versionned BUT NOT .git folder
  (setq counsel-rg-base-command
        (append
         (butlast counsel-rg-base-command)
         '("--sort" "path" "--hidden" "--glob" "!.git" "%s"))
        ;; This way, when C-x C-f we see 'dot file' or 'hidden files'
        counsel-find-file-ignore-regexp nil))

;; I don't want to quit insert mode with jk : remove
(after! evil-escape
  :config
  (setq evil-escape-key-sequence nil))

;; (after! flycheck
;;   :config
;;   (setq-default flycheck-disabled-checkers '(python-flake8)))


;; see mapping to gm bellow
(use-package! string-inflection)
(use-package! crosshairs)

(use-package! projectile
  :config
  ;; fd is fast. No need to cache or you have to SPC-x i to invalidate it multiple times
  (setq projectile-enable-caching nil))

;; If auto formating is annoying :
;; To enable it, just eval it M-:
;; (add-hook! 'before-save-hook #'+format/buffer)
;; (remove-hook! 'before-save-hook #'+format/buffer)

;; taken from
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el
(map!
      :n "C-w x" #'window-swap-states

      :n "s" #'tim/middle-of-line-forward
      :n "S" #'tim/middle-of-line-backward

      :n "^" #'doom/backward-to-bol-or-indent ;; smarter, go at 0 on second press
      :n "$" #'doom/forward-to-last-non-comment-or-eol
      :n "S-C-p" #'counsel-projectile-find-file-dwim
      :n "C-p" #'+ivy/projectile-find-file

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

      ;; Completion
      ;; :i  "C-n"  #'dabbrev-completion
      :i  "C-n"  #'tim/company-dabbrev-select-next
      :i  "C-p"  #'tim/company-dabbrev-select-previous

      "<f5>" #'tim/oorr ;; needed to restart android react app
      "<f9>" #'python-pytest

      ;; Search
      ;; :n "/" #'isearch-forward-regexp
      ;; :n "*" #'tim/isearch-forward-symbol-at-point
      ;; :n "g*" #'tim/isearch-forward-word-at-point
      ;; :n "n" #'isearch-repeat-forward
      ;; :n "N" #'isearch-repeat-backward

      :map evil-window-map
      ;; :g is for global, because when :n it doesn t work
      :g  "+" 'tim/increase-width-height
      :g  "-" 'tim/decrease-width-height

      :map isearch-mode-map
      :g "<up>" #'isearch-ring-retreat
      :g "<down>" #'isearch-ring-advance

      :map company-active-map
      :g "SPC" #'company-complete-selection

      ;; you can do C-s to perform a search inside completion :)
      ;; :map company-active-map
      ;; "TAB" #'company-complete-common


      ;; Do not change my changing window S-arrow
      ;; If you want to act on org, use S-C-{hjkl} (shift - control and vim's hjkl)
      ;; Sometimes S-C-h brings the doc, sometimes it works, keep searching
      :map org-mode-map
      "<S-up>" nil
      "<S-down>" nil
      "<S-left>" nil
      "<S-right>" nil

      ;; :map csv-mode-map
      ;; :n "<left>" #'csv-backward-field
      ;; :n "<right>" #'csv-forward-field

      :leader
      :desc "Save file" "SPC" #'save-buffer

      :desc "Search for symbol in project" "*" #'tim/search-project-bound-symbol
      :desc "Search in project" "/" #'+default/search-project-for-symbol-at-point

      :desc "Delete and go insert" "r" #'tim/replace-at-point
      :desc "Kill symbol" "d" #'tim/kill-at-point
      :desc "Replace with killed" "p" #'tim/replace-with-kill-ring

      :desc "Copy symbol" "y" #'tim/copy-symbol
      :desc "Copy and append symbol" "Y" #'tim/copy-append-symbol

      :desc "Select file" "e" #'counsel-find-file
      :desc "Query replace symbol" "%" #'tim/query-replace

      ;; my goal is to keep doom binding but replace p with x
      (:prefix-map ("x" . "project")))


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
  (setq org-agenda-files '("~/org" "~/poleemploi/org" "~/poleemploi/org/sprint09")
        org-log-done 'time
        org-ellipsis "⤵"
        org-agenda-span 30))

;; when in org file, be case insensitive
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (message "tim hook case %s" case-fold-search)
;;             (setq case-fold-search t)))
;; Instead of
;; (doom-modeline-def-modeline 'main ...)
;; I wanted
;; (doom-modeline-def-modeline 'tim ...)
;; (doom-modeline-set-modeline 'tim t)
;; But does not work. I think some hook always change modeline to main

;; Remove file size in the modeline
;; But it is changed in modeline
;; So this is a hack with timer as usual...
(defun stop-size-indication-mode ()
  (message "size-indication-mode changed to -1")
  (size-indication-mode -1)
  ;; Put here 'after 3 seconds' because if run before doom is started, I have a white screen
  ;; before opening counsel-recentf
  ;; (when (buffer-file-name) (message (buffer-file-name)))
  ;; (when (display-graphic-p)
  ;; Desactivé : si je suis plus rapide et que je suis dans le minibuffer
  ;; alors ca se déclenche et annule ce que je suis entrian de faire.
  ;; necessite une amelioration
  ;; (when (not (buffer-file-name))
  ;;   (counsel-recentf)))
  )
(run-with-timer 3 nil 'stop-size-indication-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; TIPS ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;
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


;; how to let a shell command updating a file :
;; Thanks to https://gist.github.com/ustun/73321bfcb01a8657e5b8
;; and to https://stackoverflow.com/questions/11613974/how-can-the-shell-command-output-buffer-be-kept-in-the-background
