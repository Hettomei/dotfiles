set fish_greeting

set -x EDITOR nvim
set -x VISUAL nvim
set -x LESS '-R -X -F'
set PATH $HOME/.rbenv/bin $PATH

alias v nvim
alias tod "nvim +TodoQos"
alias todo "nvim +Todo"
abbr -a vlarge "nvim -u ~/.vim/minimal_vimrc"
abbr -a g git
abbr -a bc "bc -l"

# ag doesent use pager by default
# I need to add a specific .agignorecustom because if I keep .agignore,
# when I want to search with only .gitignore it is impossible because it combine .agignore with --path-to-agignore
alias a 'ag --pager less --case-sensitive --path-to-agignore ".agignorecustom"'
# find for file name. very usefull
alias af 'ag --pager less -ig'
# Sometimes I want to use only .gitignore file
abbr -a aglarger 'ag --page less'
# --unrestricted -> ALL fiels (ignore .gitignore and .agignore)
abbr -a aflarger 'ag --pager less --unrestricted -ig'

abbr -a rmDS 'find . -name ".DS_Store" -depth -exec rm {} \;'

abbr -a rtest 'bin/bundle exec ruby -I"lib:test"'

abbr -a describe 'mysql -u root qosenergy_development -e "describe'

abbr -a be 'bundle exec'
abbr -a pps 'ps aux | grep'

switch (uname)
  case Linux
    set PATH $HOME/.linuxbrew/bin $PATH

    set MANPATH $HOME/.linuxbrew/share/man $MANPATH
    set INFOPATH $HOME/.linuxbrew/share/info $INFOPATH
    set -x RAILS_CONSOLE_STDOUT 1

    alias pbcopy 'xclip -selection clipboard'
    alias pbpaste 'xclip -o'
  case Darwin
    #because of homebrew : "brew link grep" create a suffix g
    alias grep='ggrep'
  case '*'
    echo 'You have an unknown uname (see .config/config.fish)' (uname)
end

rbenv init - | source -

source ~/.config/fish/not_in_git.fish
