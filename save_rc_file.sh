#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/ackrc $HOME/.ackrc
cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/zshrc $HOME/.zshrc
cp -v $DIR/gitconfig $HOME/.gitconfig
