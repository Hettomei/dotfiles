#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copy file into" $DIR

for file_name in 'vimrc' 'gvimrc' 'gitconfig' 'zshrc' 'irbrc'
do
  cp -v $HOME/.$file_name $DIR/$file_name
done

cd $DIR

git add -p
git commit
