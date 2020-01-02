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

echo "For evil, see https://evil.readthedocs.io/en/latest/overview.html#installation-via-package-el"
echo "M-x package-refresh-contents"
echo "M-x package-install RET evil RET"
