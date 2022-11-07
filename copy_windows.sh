#! /bin/bash

set +e

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-windows}"

mkdir -p "$DIR"
echo "Copy file into" "$DIR"

# File that start with a '.'
for file_name in 'gitconfig' 'bashrcc' 'profilee' 'tmux.conf' 'bash_logout'
do
  cp -v "$HOME/.$file_name" "$DIR/$file_name"
done

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
cd "$CURRENT_DIR"

git add -p
git status
