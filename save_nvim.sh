#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir $HOME/.config/nvim
mkdir $HOME/.config/nvim/bundle

for file_name in 'init.vim'
do
  cp -v $DIR/nvim/$file_name $HOME/.config/nvim/$file_name
done

for dir_name in 'my_snippets' 'dictionary'
do
  cp -v -R $DIR/nvim/$dir_name $HOME/.config/nvim/
done

