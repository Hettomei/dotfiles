# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth
# in memory per session
export HISTSIZE=10000
# entry in file
export HISTFILESIZE=200000

# append to the history file, don't overwrite it
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################## ADDED BY TIM

alias v=nvim
alias g=git

alias bc="echo 'bc -l' && bc -l"
alias rmDS='find . -name ".DS_Store" -depth -exec rm {} \;'
alias pps='ps aux | grep'

# alias for ag
# keep to know how to ignore more than juste .gitignore
# alias a='ag --pager less --case-sensitive --path-to-ignore ".agignorecustom"'
alias a='ag --pager less --case-sensitive'
alias af='ag --pager less -ig'
alias aglarger='ag --page less'
# --unrestricted -> ALL fiels (ignore .gitignore and .agignore)
alias aflarger='ag --pager less --unrestricted -ig'

alias todo="nvim +Todo"
alias tod="nvim +Todo"
if [ "$(uname)" == "Linux" ]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -o'
  alias n=nautilus
fi

export VISUAL=nvim
export EDITOR=nvim
export LESS='-R -X -F --chop-long-lines'

PATH=/opt/java/jdk1.8.0_77/bin:$PATH
PATH=/usr/local/go/bin:$PATH
PATH=$HOME/.linuxbrew/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH

MANPATH=$HOME/.linuxbrew/share/man:$MANPATH
INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH

eval "$(rbenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# complete -o default -o nospace -F __git_main g
# because of bash-completion (a file given with git) allow us to use completion when pressing 'g' instead of 'git'
# need to `brew install bash-completion`
__git_complete g _git

OS=$(uname) # Linux

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

rbenv_ps1 ()
{
  rbenv version | sed -e 's/ .*//'
}

PS1='\[\e[34m\]\w \[\e[33m\]$(rbenv_ps1) \[\e[31m\]$(parse_git_branch)\[\e[33m\]\t\n\[\e[0m\]\$ '
# display in title
PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'

set -b        # causes output from background processes to be output right away, not on wait for next primary prompt
set -o notify # notify when jobs running in background terminate

# shopt -s histappend                # bash history is only saved when close terminal, not after each command and this fixes it
shopt -s histappend histreedit histverify

source $HOME/.bashrc_not_in_git

set -o vi
bind 'set completion-ignore-case on'
bind '"\C-a": beginning-of-line' # ctrl-a in insert mode
bind '"\C-e": end-of-line' # ctrl-e in insert mode
bind '"\e[A": history-search-backward' # search only previous string on key up
bind '"\e[B": history-search-forward' # search only next string on key down
# This next 2 commands allow me to erase word on ctrl-w
# found on http://unix.stackexchange.com/questions/27927/is-it-possible-to-configure-ctrl-w-delete-word
stty werase undef
bind '\C-w:unix-filename-rubout'

# Sepcial teezily
dkr(){
echo "docker-compose run --rm web "$@""
docker-compose run --rm web "$@"
}

teezilycommit(){
  local url=https://github.com/teezily/teezily/commit/$1
  echo $url
  xdg-open $url
}

simplehttp(){
  local command="python -m SimpleHTTPServer 8000"
  echo $command
  $command
}

rtest(){
  echo "ls $1 | entr bash -c \"date; bin/ruby -I\"lib:test\" $1\""
  echo
  ls $1 | entr bash -c "date; bin/ruby -I\"lib:test\" $1"
}

# Tips
# youtube-dl --extract-audio --audio-format mp3 $file
