#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/ackrc $HOME/.ackrc
cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/bashrc $HOME/.bashrc
cp -v $DIR/gitconfig $HOME/.gitconfig

touch $HOME/git-completion.bash
echo touch $HOME/git-completion.bash or find it at
echo https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
echo or
echo https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
echo $HOME/.touch bashrc_not_in_git
touch $HOME/.bashrc_not_in_git
