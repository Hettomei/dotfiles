#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copy file into" $DIR

# File that start with a '.'
for file_name in 'gitconfig' 'zshrc' 'irbrc' 'ackrc' 'bashrc'
do
  cp -v $HOME/.$file_name $DIR/$file_name
done

# Files
for file_name in 'notify.sh' 'notify2.sh'
do
  cp -v $HOME/$file_name $DIR/$file_name
done

#### VIM ####
rm -r $DIR/vim
mkdir $DIR/vim

for file_name in 'vimrc' 'gvimrc' 'minimal_vimrc'
do
  cp -v $HOME/.vim/$file_name $DIR/vim/$file_name
done

for file_name in 'my_snippets' 'dictionary'
do
  cp -v -R $HOME/.vim/$file_name $DIR/vim/
done

#### NVIM ####
rm -r $DIR/nvim
mkdir $DIR/nvim

for file_name in 'init.vim'
do
  cp -v $HOME/.config/nvim/$file_name $DIR/nvim/$file_name
done

for file_name in 'my_snippets' 'dictionary'
do
  cp -v -R $HOME/.config/nvim/$file_name $DIR/nvim/
done

#### FISH ####
rm -r $DIR/fish
mkdir $DIR/fish

cp -v $HOME/.config/fish/config.fish $DIR/fish/config.fish
cp -v $HOME/.config/fish/not_in_git.fish $DIR/fish/not_in_git.fish
cp -v -R $HOME/.config/fish/functions $DIR/fish/

### TERMINATOR ###
cp -v $HOME/.config/terminator/config $DIR/terminator_config

cd $DIR

git add -p
git status
