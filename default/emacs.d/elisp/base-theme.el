(use-package solarized-theme
  :defer t
  :init
  (if (display-graphic-p)
      (load-theme 'solarized-light t)
      (load-theme 'solarized-wombat-dark t)))
    ;; (load-theme 'solarized-dark t)))

(provide 'base-theme)
