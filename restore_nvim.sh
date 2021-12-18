#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

mkdir -p $HOME/.config/nvim/bundle

for file_name in 'init.vim'
do
  cp -v $DIR/nvim/$file_name $HOME/.config/nvim/$file_name
done

for dir_name in 'my_snippets'
  do
  mkdir -p $HOME/.config/nvim/$dir_name
  cp -v -R $DIR/nvim/$dir_name $HOME/.config/nvim/
done


echo 'to install vim-plug see https://github.com/junegunn/vim-plug#installation'
echo "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo 'nvim +PlugInstall'
echo 'nvim +PlugUpdate'
