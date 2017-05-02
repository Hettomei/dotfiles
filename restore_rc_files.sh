#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/gemrc $HOME/.gemrc
cp -v $DIR/bashrc $HOME/.bashrc
cp -v $DIR/gitconfig $HOME/.gitconfig

echo touch $HOME/.bashrc_not_in_git
touch $HOME/.bashrc_not_in_git

echo touch $HOME/.bashrc_special_conf
touch $HOME/.bashrc_special_conf
