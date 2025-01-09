#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/wsl_conf"

mkdir -p "$DIR"
echo "Copy file into" "$DIR"
cp -v "$HOME/.gitconfig" "$DIR/gitconfig"
cp -v "$HOME/.bashrcc" "$DIR/bashrcc"
cp -v "$HOME/.bash_logout" "$DIR/bash_logout"
cp -v "$HOME/.profilee" "$DIR/profilee"
cp -v "$HOME/.tmux.conf" "$DIR/tmux.conf"
cp -v "$WIN_HOME/.ideavimrc" "$DIR/ideavimrc" || echo "no ideavimrc"

#### Nvim ####
mkdir -p "$DIR/nvim"

cp -v "$HOME/.config/nvim/init.vim" "$DIR/nvim/init.vim"
cp -r "$HOME/.config/nvim/my_snippets" "$DIR/nvim/"


#### commit ####
git add -p
git status
