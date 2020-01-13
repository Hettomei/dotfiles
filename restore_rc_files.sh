#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/gemrc $HOME/.gemrc
cp -v $DIR/bashrcc $HOME/.bashrcc
cp -v $DIR/profilee $HOME/.profilee
cp -v $DIR/gitconfig $HOME/.gitconfig

cat <<-____HERE

On the first install, please do

echo 'source \$HOME/.bashrcc' >> $HOME/.bashrc
echo 'source \$HOME/.profilee' >> $HOME/.profile

Also, read  ~/.gitconfig to ensure 'user'

____HERE
