#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/windows"

cp -v $USERPROFILE/.ideavimrc $DIR/ideavimrc

#### Emacs ####
mkdir -p "$DIR/emacs.d"
cp "$APPDATA/.emacs.d/init.el" "$DIR/emacs.d/"

cat <<-____HERE

Ce script est pour les utilitaires windows

Si c est de la conf "msys2" alors il faut utilsier copy_msys2

____HERE

git add -p
git status
