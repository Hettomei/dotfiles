#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copy file into" $DIR

# File that start with a '.'
for file_name in 'gitconfig' 'zshrc' 'irbrc' 'gemrc' 'bashrc' 'bashrc_special_conf' 'tmux.conf'
do
  cp -v $HOME/.$file_name $DIR/$file_name
done

#### NVIM ####
rm -r $DIR/nvim
mkdir $DIR/nvim

for file_name in 'init.vim'
do
  cp -v $HOME/.config/nvim/$file_name $DIR/nvim/$file_name
done

for file_name in 'my_snippets'
do
  cp -v -R $HOME/.config/nvim/$file_name $DIR/nvim/
done

### TERMINATOR ###
cp -v $HOME/.config/terminator/config $DIR/old/terminator_config

cd $DIR

git add -p
git status
