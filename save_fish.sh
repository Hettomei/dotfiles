#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/fish/config.fish $HOME/.config/fish/config.fish
cp -v -R "$DIR/fish/functions" "$HOME/.config/fish/"
