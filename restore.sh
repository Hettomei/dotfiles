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
cd $DIR

