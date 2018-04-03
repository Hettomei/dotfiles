#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/gemrc $HOME/.gemrc
cp -v $DIR/bashrcc $HOME/.bashrcc
cp -v $DIR/gitconfig $HOME/.gitconfig

echo touch $HOME/.bashrc_not_in_git
touch $HOME/.bashrc_not_in_git

cat <<-____HERE

You need to add
source \$HOME/.bashrcc
at the end of .bashrc
you can copy/paste :

echo 'source \$HOME/.bashrcc' >> $HOME/.bashrc
____HERE
