#! /bin/bash
# Ce script est fait pour etre lancé via une console de msys2 et non pas via un cmd windows
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

DIR="$CURRENT_DIR/${1:-windows}"

cp -v "$DIR/ideavimrc" "$USERPROFILE/.ideavimrc"
cp -v "$DIR/vscode/settings.json" "$APPDATA/Code/User/settings.json"  || echo "no vscodesettings"
cp -rv "$DIR/vscode/snippets" "$APPDATA/Code/User/snippets"  || echo "no snippet"

cat <<-____HERE

--- GIT ---
Also, read  $USERPROFILE/.gitconfig to ensure 'user'
If you want a user per project you can edit PROJECT_PATH/.git/config
or you can run
git config user.email 2079042+Hettomei@users.noreply.github.com

---- VIM ---
To install vim on windows : go to https://www.vim.org/download.php

____HERE
