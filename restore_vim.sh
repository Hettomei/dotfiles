#! /bin/bash

if [ -z "$1" ]
  then
    echo "You need to supply a folder to copy."
    echo "Example:"
    echo $0 macbook
    exit 2
fi

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="$CURRENT_DIR/$1"

for file_name in 'vimrc' 'gvimrc'
do
  cp -v $DIR/vim/$file_name $HOME/.vim/$file_name
done
