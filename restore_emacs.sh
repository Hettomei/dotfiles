#! /bin/bash

# get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

mkdir -p $HOME/.emacs.d

# Add here a list of file you want to copy
for file_name in 'init.el'
do
  cp -v $DIR/emacs.d/$file_name $HOME/.emacs.d/$file_name
done

cat <<EOF
copy init.el
M-x package-refresh-contents
M-x package-install-selected-packages

Sometimes, solarized is not installed, so :
M-x package-install RET solarized-theme RET

M-x package-install RET evil RET
EOF
