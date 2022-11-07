#! /bin/bash
set -e

#get the dir where this script is launched
CURRENT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

DIR="$CURRENT_DIR/${1:-windows}"

cp -v "$DIR/bashrcc" "$HOME/.bashrcc"
cp -v "$DIR/profilee" "$HOME/.profilee"
cp -v "$DIR/gitconfig" "$HOME/.gitconfig"
# cp -v "$DIR/ensemble_programming_pull" "$HOME/bin/ensemble_programming_pull"
# cp -v "$DIR/ensemble_programming_push" "$HOME/bin/ensemble_programming_push"

### tmux
cp -v "$DIR/tmux.conf" "$HOME/.tmux.conf"

### nvim
mkdir -p "$HOME/.config/nvim/bundle"
cp -v "$DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"

mkdir -p "$HOME/.config/nvim/my_snippets"
cp -v -R "$DIR/nvim/my_snippets" "$HOME/.config/nvim/"

mkdir -p "$HOME/.emacs.d/snippets"
mkdir -p "$APPDATA/.emacs.d"
cp -v "$DIR/emacs.d/init.el" "$HOME/.emacs.d/init.el"
cp -v "$DIR/emacs.d/init.el" "$APPDATA/.emacs.d/init.el"

cat <<-____HERE

--- FIRST INSTALL ---
echo 'source \$HOME/.bashrcc' >> $HOME/.bashrc
echo 'source \$HOME/.profilee' >> $HOME/.profile
chmod +x ~/bin/ensemble_programming_*

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
There is a default/bash_logout that save history. It wasn't copied.
** you have to do it manually : **
cp default/bash_logout ~/.bash_logout
mkdir ~/history_backups

---- NVIM ---
to install vim-plug see https://github.com/junegunn/vim-plug#installation
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
nvim +PlugUpdate

---- TMUX ---
to install tmux plugin :
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux kill-server
open tmux, then prefix + I
and again prefix + I

to update tmux plugin :
prefix + U
then type 'all'

To start a tmux instance pre configured :
./programmes/dotfiles/default/tmux-env/formation.sh

____HERE
