set fish_greeting

set -x EDITOR nvim
set -x VISUAL nvim
set -x LESS '-R -X -F'
set PATH $HOME/.rbenv/bin $PATH

alias v nvim
alias g git
alias bc "bc -l"

# ag doesent use pager by default
# I need to add a specific .agignorecustom because if I keep .agignore,
# when I want to search with only .gitignore it is impossible because it combine .agignore with --path-to-agignore
alias a 'ag --pager less --case-sensitive --path-to-agignore ".agignorecustom"'
# find for file name. very usefull
alias af 'ag --pager less -g'
# Sometimes I want to use only .gitignore file
alias aglarger 'ag --page less'
# --unrestricted -> ALL fiels (ignore .gitignore and .agignore)
alias aflarger 'ag  --pager less --unrestricted -g'

alias f 'find . -name'
alias rmDS 'find . -name ".DS_Store" -depth -exec rm {} \;'

alias rtest "ruby -I\"lib:test\""


switch (uname)
  case Linux
    function qantumcommit
      xdg-open http://gitlab.qosenergy.com/qosenergy/qantum/commit/$argv
    end

    set PATH $HOME/.linuxbrew/bin $PATH

    set MANPATH $HOME/.linuxbrew/share/man $MANPATH
    set INFOPATH $HOME/.linuxbrew/share/info $INFOPATH

    alias pbcopy 'xclip -selection clipboard'
  case Darwin
  case '*'
    echo 'You have an unknown uname (see .config/config.fish)' (uname)
end

rbenv init - | source -
