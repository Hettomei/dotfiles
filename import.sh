#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Copy file into" $DIR
cp -v \
  $HOME/.vimrc.after \
  $HOME/.vimrc.before \
  $HOME/.gvimrc.after \
  $HOME/.gitconfig \
  $HOME/.zshrc \
  $DIR
cd $DIR
git add -p
