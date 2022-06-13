;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)


;; make 's' binded to go to text
;; Not disabled here because it enhance f and t
;; (package! evil-snipe :disable t)
(package! evil/easymotion :disable t)

;; tide run tsserver
;; But always show an annoying minibuffer information
;; more at https://github.com/ananthakumaran/tide
(package! tide :disable t)

;; disable solaire because it is not brighter
(package! solaire-mode :disable t)

;; prefere a simpler yasnippet
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/editor/snippets/README.org
(package! doom-snippets :ignore t)
(package! auto-yasnippet :ignore t)

(package! keyfreq :disable t)

(package! string-inflection
  :recipe (:host github :repo "akicho8/string-inflection"))

(package! groovy-emacs-modes
  :recipe (:host github :repo "Groovy-Emacs-Modes/groovy-emacs-modes"))

(package! crosshairs
  :recipe (:host github
           :repo "emacsmirror/emacswiki.org"
           ;; Need to force master, or else it is on 'readme'
           :branch "master"
           :files ("crosshairs.el")))

(package! tree-sitter)
(package! tree-sitter-langs)

;; completion
;; like hippi expand dabbrev company
;; By minad, creator of vertico
;;(package! cape
;;  :recipe (:host github :repo "minad/cape"))

;; I don't want to quit insert mode with jk : remove
(disable-packages! evil-escape)

;; disable smartparens that automatically completed " with a second " (same for ''())
;; It also do a good job dealing with () movement, see https://smartparens.readthedocs.io/en/latest/
;; (disable-packages! smartparens)
;; update: cannot disable because it is a core package. Need to disable hook.

;; sometimes, doom sync is not enough, need to do `doom sync -u`
