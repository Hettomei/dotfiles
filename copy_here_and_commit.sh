#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copy file into" $DIR

for file_name in 'gitconfig' 'zshrc' 'irbrc' 'ackrc'
do
  cp -v $HOME/.$file_name $DIR/$file_name
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

#### FISH ####
rm -r $DIR/fish
mkdir $DIR/fish

cp -v $HOME/.config/fish/config.fish $DIR/fish/config.fish
cp -v -R $HOME/.config/fish/functions $DIR/fish/

cd $DIR

git add -p
git status
echo -n "Tape entrée mec"
read
git commit
