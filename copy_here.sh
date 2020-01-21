#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

mkdir -p $DIR
echo "Copy file into" $DIR

# File that start with a '.'
for file_name in 'gitconfig' 'irbrc' 'gemrc' 'bashrcc' 'profilee' 'tmux.conf'
do
  cp -v $HOME/.$file_name $DIR/$file_name
done

#### Emacs ####
rm -r "$DIR/doom.d"

cp -v -r "$HOME/.doom.d" "$DIR"
mv "$DIR/.doom.d" "$DIR/doom.d"

# for folder_name in 'elisp' 'snippets'
# do
#   cp -v -r $HOME/.emacs.d/$folder_name $DIR/emacs.d/
# done

#### Nvim ####
rm -r $DIR/nvim
mkdir $DIR/nvim

cp -v $HOME/.config/nvim/init.vim $DIR/nvim/init.vim
cp -v -R $HOME/.config/nvim/my_snippets $DIR/nvim/

#### teamocil ####
rm -r $DIR/teamocil
mkdir $DIR/teamocil
cp -v -R $HOME/.teamocil/* $DIR/teamocil


#### commit ####
cd $CURRENT_DIR

git add -p
git status
