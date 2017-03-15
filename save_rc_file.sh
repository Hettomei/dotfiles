#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/gemrc $HOME/.gemrc
cp -v $DIR/bashrc $HOME/.bashrc
cp -v $DIR/gitconfig $HOME/.gitconfig
cp -v $DIR/tmux.conf $HOME/.tmux.conf

echo touch $HOME/.bashrc_not_in_git
touch $HOME/.bashrc_not_in_git

echo touch $HOME/.bashrc_special_conf
touch $HOME/.bashrc_special_conf

echo
echo 'to install tmux plugin :'
echo "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
echo 'tmux kill-server'
echo 'open tmux, then prefix + I'
echo 'and again prefix + I'
