#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/base.sh

DIR="$CURRENT_DIR/$1"

for file_name in 'vimrc' 'gvimrc'
do
  cp -v $DIR/vim/$file_name $HOME/.vim/$file_name
done
