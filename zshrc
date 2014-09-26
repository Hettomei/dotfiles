###################
# TIPS AND TRICKS #
###################
#
# grepall finded_text file_extension
#
###
# on big command line press : CTRL-X-E (hold ctrl) and you can edit it on vim
#
###
# On os X, when press "space" to show preview, to convert file to text preview file :
# example to convert .scss file
# find . -name '*.scss' -exec SetFile -t TEXT {} \;
#
###
# convert wma into mp3
# for i in *.wma; do ffmpeg -i "$i" -ab 96k "${i%wma}mp3"; done
#
###
# Change every occurence into some files
# perl -i -p -e's/foo/bar/g' $(ack -l foo)
#
###
# display only file which contains foo
# ack -l foo
# Without previous ACK search :
# perl -i -p -e's/foo/bar/g' $(ack -f)
# or
# perl -i -p -e's/foo/bar/g' $(ack -f --ruby)
#
###
# do some operation on files
# find . -type f -name "*.erb" -exec git rm {} \;
#
###
# Rename multiple file : (here it removes .erb extension)
# for file in `find . -type f -name "*.haml"`
# do
# mv $file `echo $file | sed 's/\.erb//g'`
# done
# or
# for f in *2012*; do mv "$f" "2012-$f";done
# or with the utility 'rename' :
# rename 's/^foo/super_bat/' *test.rb
#
###
# To sync my picture folder :
# rsync -av -e ssh Pictures hettomei@192.168.0.27:backup_mac
#
###
# To download a video from youtube and convert direct in mp3 (need youtube-dl + ffmpeg)
# youtube-dl "http://www.youtube.com/watch?v=4yRpysQxRxE&noredirect=1" --extract-audio --audio-format mp3
#
###
# How to use exuberant ctags ?
# go to the project
# ctags -R *
# then it works in vim
#
###
# Convert file type to unix utf-8
# ex some_file "+set ff=unix fileencoding=utf-8" "+x"
#
# ex -> enter in vim ex mode :D
###
# Installing homebrew
# classical from website, and then add
# brew tap homebrew/dupes
# brew install homebrew/dupes/grep # For grep // installed with prefix g, so type ggrep
###
# resize big picture into little BE CAREFULL IT DELETE ALL PICTURE in the folder
# cd my_folder
# mogrify -resize 1200x1200 *.jpg
###################
# TIPS AND TRICKS #
###################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="alanpeabody"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man rbenv bundler brew osx) # vi-mode) vi-mode is cool but I can't find last command starting with same string while presing up arrow

source $ZSH/oh-my-zsh.sh

# remove Correct spelling of all arguments
unsetopt correct_all
#ne partage pas l'historique entre les session zsh. supprimer la ligne si je veux de nouveau les partager
setopt no_share_history

export LESS='-R -X -F'
export VISUAL="nvim"
export EDITOR="nvim"

# User configuration

export PATH=/usr/local/bin:$PATH

export JAVA_HOME=/Library/Java/Home
PATH=$PATH:$JAVA_HOME

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# For a full list of active aliases, run `alias`.
###############################
#            ALIAS            #
# aka 'je suis une feignasse' #
###############################
#Alias pour aller directement vers ces paths
alias devinette='cd ~/programmes/Ruby/devinette'

# git
alias g='git'
alias pushmaster="git push origin master && git push upstream master"
alias pushprod="git push origin production && git push upstream production"
alias pushall="pushmaster && pushprod"

#good website :  http://alias.sh/compact-colorized-git-log
alias vv='nvim'
alias v='vim' #'$HOME/programmes/neovim/build/bin/nvim'
alias nv='nvim' #'$HOME/programmes/neovim/build/bin/nvim'
alias e='echo'
alias a='ack'
alias rmDS='find . -name ".DS_Store" -depth -exec rm {} \;'
alias grep='ggrep' #because of homebrew : "brew link grep" create a suffix g
alias pause=job_break
#Copy current path to clipboard.
#works on mac OS X maybe not linux
alias pwdc='echo -n $(pwd) | pbcopy; echo "copy to clipboard: $(pbpaste)"'
#because bc as the "scale" init to 0 if run without argument
alias bc='bc -l'
alias -s rb=vim
alias -s txt=vim
alias -s log=vim
alias -s slim=vim
alias -s haml=vim

function tn(){
  sleep $1 && terminal-notifier -message $2
}

function tnm(){
  tn $(($1*60)) $2
}

#################
# Special Rails #
#################

#obligé sinon il ne comprend pas rake de rails......
#alias rake='noglob rake'
#need a file 'Procfile'
function fsa() {
  display='foreman start -c mysql=1,redis=1,mongodb=1,sidekiq=1,beanstalkd=1,backburner=1'
  echo -n $display | pbcopy
  echo $display
}
alias fsw='foreman start web'
alias fsmy='foreman start mysql'
alias fsmyr='foreman start -c mysql=1,redis=1'
alias fsmor='foreman start -c mongodb=1,redis=1'
alias fssbb='foreman start -c sidekiq=1,beanstalkd=1,backburner=1'
alias be='noglob bundle exec'
alias ber='noglob bundle exec rspec'
alias sp='spin push'

function simplehttp(){
  echo "python -m SimpleHTTPServer 8000"
  python -m SimpleHTTPServer 8000
}
source ./.zshrc_not_on_github

############
# Bemyboat #
############
alias front='cd ~/BeMyBoat/bmb_front'
alias crm='cd ~/BeMyBoat/bemyboat/webapp'
alias tabarlus='cd ~/BeMyBoat/tabarlus'
alias tabarlusapi='cd ~/BeMyBoat/tabarlus_api'
alias tabarlusapis='cd ~/BeMyBoat/tabarlus_api/lib/tabarlus_api'
alias business='cd ~/BeMyBoat/bmb_business'
alias mmk='cd ~/BeMyBoat/mmk'
alias mmks='cd ~/BeMyBoat/mmk/lib/mmk'
alias sedna='cd ~/BeMyBoat/sedna'
alias sednas='cd ~/BeMyBoat/sedna/lib/sedna'
alias mister_b='cd ~/BeMyBoat/mister_booking'
alias mister_bs='cd ~/BeMyBoat/mister_booking/lib/mister_b'
alias cherche='cd ~/BeMyBoat/cherche-avocat'

##########
# Oyatis #
##########
alias oyatis='cd ~/oyatis/hospitality'
function owifi(){
  login="9897835863"
  pass="DfUkrdK7ThH2Wvu64Q"
  echo $login
  echo $login | pbcopy
  echo $pass
  sleep 3 && echo $pass | pbcopy
  echo "done"
}
alias ofspgr='foreman start -c db=1,redis=1 --procfile=ProcfileDevelopment'
alias ofspgrw='foreman start -c db=1,redis=1,worker=1 --procfile=ProcfileDevelopment'
alias ofsw='foreman start web --procfile=ProcfileDevelopment'
