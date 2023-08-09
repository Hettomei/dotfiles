#! /bin/bash
set -eu

# get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

mkdir -p "$HOME/.doom.d/snippets"
# Add here a list of file you want to copy
for file_name in 'init.el' 'config.el' 'packages.el'
do
  cp -v "$DIR/doom.d/$file_name" "$HOME/.doom.d/$file_name"
done

cp -r "$DIR/doom.d/snippets" "$HOME/.doom.d/"

# Cannot do :
# cp -v -r "$DIR/doom.d" "$HOME"
# mv -vt "$HOME/doom.d" "$HOME/.doom.d"
# Because it may suppress file that was not versionned in home

cat <<EOF

# install emacs
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install emacs27 emacs27-el
# ######### OR
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get install emacs-snapshot emacs-snapshot-el


# install doom
Please go to https://github.com/hlissner/doom-emacs to install it

please run
~/.emacs.d/bin/doom sync

EOF
