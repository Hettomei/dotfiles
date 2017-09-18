#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/base.sh

DIR="$CURRENT_DIR/$1"

cp -v $DIR/tmux.conf $HOME/.tmux.conf

mkdir $HOME/.teamocil
cp -v  $CURRENT_DIR/teamocil/* $HOME/.teamocil/

cat <<-____HERE

to install tmux plugin :
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux kill-server
open tmux, then prefix + I
and again prefix + I


to update tmux plugin :
prefix + U
then type 'all'


teamocil http://www.teamocil.com/ :

gem install teamocil
tmux
teamocil horo
____HERE
