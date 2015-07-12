set fish_greeting

set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux LESS '-R -X -F'

set PATH /usr/local/bin $PATH

alias v nvim
alias g git
alias bc "bc -l"

. (rbenv init -)
