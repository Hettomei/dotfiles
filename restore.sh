#! /bin/bash

#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "create backup files into /backup" $DIR
cp -v --backup=numbered \
  $HOME/.vimrc \
  $HOME/.gvimrc \
  $HOME/.gitconfig \
  $HOME/.zshrc \
  $DIR/backup

echo "restore files"
cp -v $DIR/vimrc $HOME/.vimrc
cp -v $DIR/gvimrc $HOME/.gvimrc
cp -v $DIR/gitconfig $HOME/.gitconfig
cp -v $DIR/zshrc $HOME/.zshrc
