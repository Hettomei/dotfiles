#! /bin/bash

#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "create backup files into /backup" $DIR
cp -v --backup=numbered \
  $HOME/.vimrc.after \
  $HOME/.vimrc.before \
  $HOME/.gvimrc.after \
  $HOME/.gitconfig \
  $HOME/.zshrc \
  $DIR/backup

echo "restore files"
cp -v $DIR/.vimrc.after $HOME/.vimrc.after
cp -v $DIR/.vimrc.before $HOME/.vimrc.before
cp -v $DIR/.gvimrc.after $HOME/.gvimrc.after
cp -v $DIR/.gitconfig $HOME/.gitconfig
cp -v $DIR/.zshrc $HOME/.zshrc
