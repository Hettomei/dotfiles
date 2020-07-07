#! /bin/bash

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-default}"

cp -v $DIR/irbrc $HOME/.irbrc
cp -v $DIR/gemrc $HOME/.gemrc
cp -v $DIR/bashrcc $HOME/.bashrcc
cp -v $DIR/profilee $HOME/.profilee
cp -v $DIR/gitconfig $HOME/.gitconfig

cat <<-____HERE

--- FIRST INSTALL ---
echo 'source \$HOME/.bashrcc' >> $HOME/.bashrc
echo 'source \$HOME/.profilee' >> $HOME/.profile

--- GIT ---
Also, read  ~/.gitconfig to ensure 'user'
If you want a user per project you can edit PROJECT_PATH/.git/config
or you can run
git config user.email timothee.gauthier@consertotech.pro

--- HISTORY ---
Remember on xubuntu there is a problem with history / HISTSIZE....
and you may need to update /etc/bash.bashrc
I put a link on top of .bashrcc that explain it

---- LOGOUT ---
There is a default/bash_logout that save history. It wasn't copied. you have to do it manually

____HERE
