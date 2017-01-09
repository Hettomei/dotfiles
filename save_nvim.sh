#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $HOME/.config/nvim/bundle

for file_name in 'init.vim'
do
  cp -v $DIR/nvim/$file_name $HOME/.config/nvim/$file_name
done

for dir_name in 'my_snippets' 'dictionary'
  do
  mkdir -p $HOME/.config/nvim/$dir_name
  cp -v -R $DIR/nvim/$dir_name $HOME/.config/nvim/
done


echo 'to install vim vundle :'
echo "git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim"
echo 'nvim +PluginInstall +qa'
