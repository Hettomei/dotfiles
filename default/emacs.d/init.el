;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)

(require 'tim-base)
(require 'ag-config)
(require 'evil-config)

(require 'lang-python)
(require 'lang-ruby)
(require 'lang-go)
(require 'lang-php)
(require 'lang-javascript)
(require 'lang-web)
(require 'lang-c)
