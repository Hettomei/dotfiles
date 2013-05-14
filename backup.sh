#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Copy file into" $DIR
cp -v \
  $HOME/.vimrc \
  $HOME/.gitconfig \
  $HOME/.zshrc \
  $DIR
cd $DIR
git add -p

#add input then "git commit -m $input
#http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html
