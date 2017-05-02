#! /bin/bash
#get the dir where this script is launched
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v $DIR/tmux.conf $HOME/.tmux.conf

echo
echo 'to install tmux plugin :'
echo "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
echo 'tmux kill-server'
echo 'open tmux, then prefix + I'
echo 'and again prefix + I'
