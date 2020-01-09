(use-package solarized-theme
  :defer t
  :init
  (if (display-graphic-p)
      (load-theme 'solarized-light t)
    ;; Put wonbat here because looks like default solarized without reconfiguring terminal or tmux
    ;; (load-theme 'solarized-wombat-dark t)))
    (load-theme 'solarized-dark t)))

(provide 'base-theme)
