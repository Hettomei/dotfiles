#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/ackrc $HOME/.ackrc
cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/zshrc $HOME/.zshrc
cp -v $DIR/bashrc $HOME/.bashrc
cp -v $DIR/gitconfig $HOME/.gitconfig

echo touch git-completion.bash or find it at https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
touch $HOME/git-completion.bash
echo touch bashrc_not_in_git
touch $HOME/.bashrc_not_in_git
