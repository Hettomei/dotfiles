(defun middle-of-line-forward ()
  "Put cursor at the middle point of the line. try to mimic vim-skip"
  (interactive)
  (goto-char (/ (+ (point) (point-at-eol)) 2)))

(defun middle-of-line-backward ()
  "Put cursor at the middle point of the line. try to mimic vim-skip"
  (interactive)
  (goto-char (/ (+ (point) (point-at-bol)) 2)))

;; TODO fix bug : when on the first char of word, it delete the previous one
(defun delete-and-replace-word ()
  "Kill the word at point."
  (interactive)
  (backward-word)
  (kill-word 1)
  (evil-insert 1))

;; load evil
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-backspace-join-lines t)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-ex-search-case (quote sensitive))
  (setq evil-search-module 'evil-search)
  (setq evil-search-wrap nil)
  (setq evil-shift-round nil)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-Y-yank-to-eol t)
  :config ;; tweak evil after loading it
  (evil-mode 1)
  ;; set leader to space
  (evil-set-leader 'normal (kbd "SPC"))
  ;; cannot use <leader><leader>
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>e") 'find-file)
  ;; Need to refine this <leader>f: need to display file name
  (evil-define-key 'normal 'global (kbd "<leader>f") 'find-file)

  (evil-define-key 'normal 'global (kbd "C-<left>") 'evil-window-left)
  (evil-define-key 'normal 'global (kbd "C-<down>") 'evil-window-down)
  (evil-define-key 'normal 'global (kbd "C-<up>") 'evil-window-up)
  (evil-define-key 'normal 'global (kbd "C-<right>") 'evil-window-right)

  (evil-define-key 'normal 'global (kbd "C-w x") 'window-swap-state)


  ;; mimic vim-skip
  (evil-define-key 'normal 'global (kbd "s") 'middle-of-line-forward)
  (evil-define-key 'normal 'global (kbd "S") 'middle-of-line-backward)
  (evil-define-key 'normal 'global (kbd "<leader>r") 'delete-and-replace-word))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode 1))

(use-package evil-numbers
  :ensure t
  :config
  (evil-define-key 'normal 'global (kbd "C-a") 'evil-numbers/inc-at-pt)
  (evil-define-key 'normal 'global (kbd "C-x") 'evil-numbers/dec-at-pt))

;; https://github.com/emacs-evil/evil-surround
;; To remove the delimiters entirely to 'Hello world!' press ds'.  Hello world!. or ysiw( . or visual mode then S(
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'evil-config)
