#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copy file into" $DIR

# File that start with a '.'
for file_name in 'gitconfig' 'irbrc' 'gemrc' 'bashrc' 'bashrc_special_conf' 'tmux.conf'
do
  cp -v $HOME/.$file_name $DIR/$file_name
done

#### NVIM ####
rm -r $DIR/nvim
mkdir $DIR/nvim

cp -v $HOME/.config/nvim/init.vim $DIR/nvim/init.vim
cp -v -R $HOME/.config/nvim/my_snippets $DIR/nvim/


mkdir $DIR/teamocil
cp -v $HOME/.teamocil/* $DIR/teamocil/


cd $DIR

git add -p
git status
