##################
# TIPS AND TRICKS
# grepall finded_text file_extension
# on big command line press : CTRL-X-E (hold ctrl) and you can edit it on vim
#

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="aussiegeek"
#ZSH_THEME="rkj"
ZSH_THEME="alanpeabody"
#comme son nom l'indique :
#ZSH_THEME="random"
#theme de base :
#ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export VISUAL="vim"
export EDITOR="vim"

export PATH=$HOME/.rbenv/shims:/usr/local/sbin:$PATH
source "/usr/local/Cellar/rbenv/0.3.0/libexec/../completions/rbenv.zsh"
rbenv rehash 2>/dev/null
rbenv() {
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

#export INPULSE=00:50:C2:E6:E0:0D
#export IN=$INPULSE
#PATH=$PATH:/Users/tim/programmes/pulse_sdk/arm-2010q1/bin

##### Android
PATH=$PATH:/Users/tim/programmes/android/sdk/tools
PATH=$PATH:/Users/tim/programmes/android/sdk/platform-tools

###JAVA
#export M2_HOME=/usr/local/apache-maven/apache-maven-3.0.4
#export M2=$M2_HOME/bin
export JAVA_HOME=/Library/Java/Home
PATH=$PATH:$JAVA_HOME

###############################
#            ALIAS            #
# aka 'je suis une feignasse' #
###############################
# Special FOLDER #
#Alias pour aller directement vers ces paths
front=/Users/tim/BeMyBoat/bmb_front
crm=/Users/tim/BeMyBoat/bemyboat/webapp
tabarlus=/Users/tim/BeMyBoat/tabarlus
tabarlusapi=/Users/tim/BeMyBoat/tabarlus_api
apitabarlus=/Users/tim/BeMyBoat/tabarlus_api
business=/Users/tim/BeMyBoat/bmb_business
mmk=/Users/tim/BeMyBoat/mmk
devinette=/Users/tim/programmes/Ruby/devinette

# unix alias #
alias g='git'
#affiche tout l'historique des modifs d'un fichier
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
# -n display line, -I ignore binary files
alias ggrep='git grep -nI'
alias v='vim'
alias e='echo'
#alias grep='grep -i'
alias rmDS='find . -name ".DS_Store" -depth -exec rm {} \;'
alias pause='ruby /Users/tim/programmes/Ruby/calcul_pause/pause.rb'
#Copy current path to clipboard. #works on mac OS X maybe not linux
alias pwdc='pwd | pbcopy && e "copy to clipboard: `pbpaste`"'

##find text 'test' il all '.txt' file recursively from current dir
#example: grepall test txt
function grepall() { 
  echo "find text '$1'"; 
  echo "In files << $2 >>"; 
  grep -ni "$1" **/*.$2
}

#ne partage pas l'historique entre les session zsh. supprimer la ligne si je veux de nouveau les partager
setopt no_share_history

#################
# Special Rails #
#################

#obligé sinon il ne comprend pas rake de rails......
#alias rake='noglob rake'
#Alias special pour les projets rails : ouvre les 2 fichiers de langue
alias vlang='v -O config/locales/fr.yml config/locales/en.yml'
#need a file 'Procfile'
alias fsa='foreman start -c mysql=1,mongodb=1,redis=1,db=1,web=0' #sidekiq=1,
alias fsw='foreman start web'
alias be='noglob bundle exec'
alias ber='noglob bundle exec rspec'

## How to upgrade vim :
# faire :
# rbenv global ree-1.8.7-2012.02
# brew update vim
# rbenv global 1.9.3
#
# To sync my picture folder :
# rsync -av -e ssh Pictures hettomei@192.168.0.27:backup_mac
