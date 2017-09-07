#! /bin/bash

if [ -z "$1" ]
  then
    echo "You need to supply a folder to copy."
    echo "Example:"
    echo $0 macbook
    exit 2
fi

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="$CURRENT_DIR/$1"

echo "current dir is $CURRENT_DIR"

echo "create dir $DIR"

mkdir -p $DIR

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


mkdir $CURRENT_DIR/teamocil
cp -v $HOME/.teamocil/* $CURRENT_DIR/teamocil/


cd $CURRENT_DIR

git add -p
git status
