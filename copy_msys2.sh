#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/msys2_conf"

mkdir -p "$DIR"
echo "Copy file into" "$DIR"
cp -v "$HOME/.gitconfig" "$DIR/gitconfig"
cp -v "$HOME/.bashrcc" "$DIR/bashrcc"
cp -v "$HOME/.profilee" "$DIR/profilee"
cp -v "$HOME/.tmux.conf" "$DIR/tmux.conf"
cp -v "$HOME/.minttyrc" "$DIR/minttyrc"
cp -v "$HOME/sol.dark" "$DIR/sol.dark"

#### Emacs ####
mkdir -p "$DIR/emacs.d"
cp "$APPDATA/.emacs.d/init.el" "$DIR/emacs.d/"

#### ensemble programming ####
rm "$DIR/ensemble_programming_pull"
rm "$DIR/ensemble_programming_push"
cp -v "$HOME/bin/ensemble_programming_pull" "$DIR/ensemble_programming_pull"
cp -v "$HOME/bin/ensemble_programming_push" "$DIR/ensemble_programming_push"

#### Nvim ####
mkdir -p "$DIR/nvim"

cp -v "$HOME/.config/nvim/init.vim" "$DIR/nvim/init.vim"
cp -r "$HOME/.config/nvim/my_snippets" "$DIR/nvim/"

#### commit ####
git add -p
git status
