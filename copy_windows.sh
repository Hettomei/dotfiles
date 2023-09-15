#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/windows"

cp -v $USERPROFILE/.ideavimrc $DIR/ideavimrc

#### Emacs ####
mkdir -p "$DIR/emacs.d"
cp "$APPDATA/.emacs.d/init.el" "$DIR/emacs.d/"

#### Nvim ####
mkdir -p "$DIR/nvim"

cp -v "~/AppData/Local/nvim/init.vim" "$DIR/nvim/init.vim"

git add -p
git status
