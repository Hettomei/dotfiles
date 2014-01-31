#! /bin/bash

#get the dir where this script is launched
GIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATE=`date +"%y-%m-%d-%H-%M-%S"`
FINAL_DIR=$GIT_DIR/backups/$DATE




echo "** Backuping files **"
mkdir $FINAL_DIR
for file_name in 'gitconfig' 'zshrc' 'irbrc' 'ackrc'
do
  cp -v $HOME/.$file_name $FINAL_DIR/$file_name
done

mkdir $FINAL_DIR/vim
for file_name in 'vimrc' 'gvimrc'
do
  cp -v $HOME/.vim/$file_name $FINAL_DIR/vim/$file_name
done

echo $HOME"/.vim/plugin -> " $FINAL_DIR"/plugin"
echo $HOME"/.vim/my_snippets -> " $FINAL_DIR"/my_snippets"
cp -R \
  $HOME/.vim/plugin \
  $HOME/.vim/my_snippets \
  $FINAL_DIR/vim/




echo "** Restoring files **"

for file_name in 'gitconfig' 'zshrc' 'irbrc' 'ackrc'
do
  cp -v $GIT_DIR/$file_name $HOME/.$file_name
done

for file_name in 'vimrc' 'gvimrc'
do
  cp -v $GIT_DIR/vim/$file_name $HOME/.vim/$file_name
done

echo $GIT_DIR"/vim/plugin -> "$HOME"/.vim/plugin"
echo $GIT_DIR"/vim/my_snippets -> "$HOME"/.vim/my_snippets"
cp -R \
  $GIT_DIR/vim/plugin \
  $GIT_DIR/vim/my_snippets \
  $HOME/.vim/
