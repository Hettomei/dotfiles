#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

mkdir -p "$DIR"
echo "Copy file into" "$DIR"

# File that start with a '.'
for file_name in 'gitconfig' 'irbrc' 'gemrc' 'bashrcc' 'profilee' 'tmux.conf' 'bash_logout'
do
  cp -v "$HOME/.$file_name" "$DIR/$file_name"
done

#### Emacs ####
rm -r "$DIR/doom.d"

cp -r "$HOME/.doom.d" "$DIR"
mv -v "$DIR/.doom.d" "$DIR/doom.d"

#### ensemble programming ####
rm "$DIR/ensemble_programming_pull"
rm "$DIR/ensemble_programming_push"
cp -v "$HOME/bin/ensemble_programming_pull" "$DIR/ensemble_programming_pull"
cp -v "$HOME/bin/ensemble_programming_push" "$DIR/ensemble_programming_push"

#### Nvim ####
rm -r "$DIR/nvim"
mkdir "$DIR/nvim"

cp -v "$HOME/.config/nvim/init.vim" "$DIR/nvim/init.vim"
cp -r "$HOME/.config/nvim/my_snippets" "$DIR/nvim/"

#### commit ####
cd "$CURRENT_DIR"

git add -p
git status
