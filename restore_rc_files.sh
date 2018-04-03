#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/gemrc $HOME/.gemrc
cp -v $DIR/bashrc $HOME/.bashrc
cp -v $DIR/gitconfig $HOME/.gitconfig
cp -v $DIR/bashrc_special_conf $HOME/.bashrc_special_conf

echo touch $HOME/.bashrc_not_in_git
touch $HOME/.bashrc_not_in_git
