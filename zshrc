##################
# TIPS AND TRICKS
# grepall finded_text file_extension
# on big command line press : CTRL-X-E (hold ctrl) and you can edit it on vim
#

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="aussiegeek"
#ZSH_THEME="rkj"
ZSH_THEME="alanpeabody"
#ZSH_THEME="random"
#theme de base :
#ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colored-man)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all
#export PAGER=''
export LESS='-R -X'

# Customize to your needs...
export VISUAL="vim"
export EDITOR="vim"

export PATH=$HOME/.rbenv/shims:/usr/local/sbin:$PATH
source "/usr/local/Cellar/rbenv/0.4.0/libexec/../completions/rbenv.zsh"
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

#export INPULSE_WATCH=00:50:C2:E6:E0:0D

##### Android
PATH=$PATH:/Users/tim/programmes/android/sdk/tools
PATH=$PATH:/Users/tim/programmes/android/sdk/platform-tools

export JAVA_HOME=/Library/Java/Home
PATH=$PATH:$JAVA_HOME

###############################
#            ALIAS            #
# aka 'je suis une feignasse' #
###############################
# Special FOLDER #
#Alias pour aller directement vers ces paths
alias front='cd /Users/tim/BeMyBoat/bmb_front'
alias crm='cd /Users/tim/BeMyBoat/bemyboat/webapp'
alias tabarlus='cd /Users/tim/BeMyBoat/tabarlus'
alias apitabarlus='cd /Users/tim/BeMyBoat/tabarlus_api'
alias apitabarluss='cd /Users/tim/BeMyBoat/tabarlus_api/lib/tabarlus_api'
alias business='cd /Users/tim/BeMyBoat/bmb_business'
alias mmk='cd /Users/tim/BeMyBoat/mmk'
alias mmks='cd /Users/tim/BeMyBoat/mmk/lib/mmk'
alias sednas='cd /Users/tim/BeMyBoat/sedna/lib/sedna'
alias sedna='cd /Users/tim/BeMyBoat/sedna'
alias devinette='cd /Users/tim/programmes/Ruby/devinette'
# git
alias pushmaster="git push origin master && git push upstream master"
alias pushprod="git push origin production && git push upstream production"
alias pushall="pushmaster && pushprod"

# unix alias #
alias g='git'
#affiche tout l'historique des modifs d'un fichier
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
#good website :  http://alias.sh/compact-colorized-git-log
# -n display line, -I ignore binary files
alias ggrep='git grep -nI'
alias v='vim'
alias e='echo'
#alias grep='grep -i'
alias rmDS='find . -name ".DS_Store" -depth -exec rm {} \;'
#alias pause='ruby /Users/tim/programmes/Ruby/calcul_pause/start_pause.rb'
alias pause='ruby /Users/tim/programmes/job_break/start_pause.rb'
#Copy current path to clipboard. #works on mac OS X maybe not linux
alias pwdc='echo -n `pwd` | pbcopy; echo "copy to clipboard: `pbpaste`"'

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
#need a file 'Procfile'
alias fsa='foreman start -c mysql=1,mongodb=1,redis=1,db=1,beanstalkd=1,backburner=1,web=0,sidekiq=1'
alias fsw='foreman start web'
alias be='noglob bundle exec'
alias ber='noglob bundle exec rspec'
alias sp='spin push'

## How to upgrade vim :
# faire :
# rbenv global ree-1.8.7-2012.02
# brew update vim
# rbenv global 1.9.3
#
# To sync my picture folder :
# rsync -av -e ssh Pictures hettomei@192.168.0.27:backup_mac
#
# How to view file by pressing space in mac for given extension :
# find . -name '*.rabl' -exec /Developer/Tools/SetFile -t TEXT {} \;

#open all rb file with vim. taken here : http://grml.org/zsh/zsh-lovers.html
alias -s rb=vim
alias -s yml=vim

#convert wma into mp3
#for i in *.wma; do ffmpeg -i "$i" -ab 96k "${i%wma}mp3"; done
