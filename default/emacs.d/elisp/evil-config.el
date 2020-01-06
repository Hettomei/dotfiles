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
  (evil-mode)

  ;; example how to map a command in normal mode (called 'normal state' in evil)
  (define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit))

(provide 'evil-config)
