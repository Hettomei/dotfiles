#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WINDIR="$CURRENT_DIR/windows"

cp -v "$USERPROFILE/.ideavimrc" "$WINDIR/ideavimrc" || echo "no ideavimrc"

mkdir -p "$WINDIR/vscode"
cp -v "$APPDATA/Code/User/settings.json" "$WINDIR/vscode/settings.json" || echo "no vscodesettings"
cp -rv "$APPDATA/Code/User/snippets" "$WINDIR/vscode/snippets" || echo "no snippet"

mkdir -p "$WINDIR/emacs.d"
cp "$APPDATA/.emacs.d/init.el" "$WINDIR/emacs.d/" || echo "no emacs"

mkdir -p "$WINDIR/nvim"
LOCAL_APPDATA="$USERPROFILE/AppData/Local"
cp -v "$LOCAL_APPDATA/nvim/init.vim" "$WINDIR/nvim/init.vim" || echo "no windows nvim"


#### commit ####
git add -p
git status
