#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

DIR="$CURRENT_DIR/wsl_conf"

cp -v "$DIR/bashrcc" "$HOME/.bashrcc"
touch "$HOME/.bashrc_secret"
cp -v "$DIR/profilee" "$HOME/.profilee"
cp -v "$DIR/gitconfig" "$HOME/.gitconfig"
cp -v "$DIR/ideavimrc" "$WIN_HOME/.ideavimrc"
# cp -v "$DIR/ensemble_programming_pull" "$HOME/bin/ensemble_programming_pull"
# cp -v "$DIR/ensemble_programming_push" "$HOME/bin/ensemble_programming_push"

### tmux
cp -v "$DIR/tmux.conf" "$HOME/.tmux.conf"

### nvim
mkdir -p "$HOME/.config/nvim/bundle"
cp -v "$DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"

mkdir -p "$HOME/.config/nvim/my_snippets"
cp -v -R "$DIR/nvim/my_snippets" "$HOME/.config/nvim/"

# mkdir -p "$HOME/.emacs.d/snippets"
# mkdir -p "$APPDATA/.emacs.d"
# cp -v "$DIR/emacs.d/init.el" "$HOME/.emacs.d/init.el"
# cp -v "$DIR/emacs.d/init.el" "$APPDATA/.emacs.d/init.el"

cat <<-____HERE

--- FIRST INSTALL ---
  echo 'source \$HOME/.bashrc_secret' >> $HOME/.bashrc
  echo 'source \$HOME/.bashrcc' >> $HOME/.bashrc
  echo 'source \$HOME/.profilee' >> $HOME/.profile
  chmod +x ~/bin/ensemble_programming_*

--- DEPRECATED COULEUR DU TERMINAL ---
copier les fichiers suivant :
  cp $DIR/sol.dark $HOME
  cp $DIR/minttyrc $HOME/.minttyrc

--- GIT ---
Also, read  ~/.gitconfig to ensure 'user'
If you want a user per project you can edit PROJECT_PATH/.git/config
or you can run
  git config user.email 2079042+Hettomei@users.noreply.github.com

---- NVIM ---
to install vim-plug see https://github.com/junegunn/vim-plug#installation
  curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  nvim +PlugInstall
  nvim +PlugUpdate

To have copy / paste in "+ or "* register : download win32yank at https://github.com/equalsraf/win32yank/releases/
and copy paste win32yank.exe into /usr/local/bin of msys dir
or :
  mkdir $HOME/tmp
  cd $HOME/tmp
  curl -fLo ./win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
  unzip win32yank.zip
  mkdir -p /usr/local/bin
  cp win32yank.exe /usr/local/bin

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
./programmes/dotfiles/tmux-env/formation.sh

---- WSL ---

Il est possible que WSL telecharge lentement
Pour le verifier :
curl https://hil-speed.hetzner.com/100MB.bin -o 100MB.bin
Si vous etes < à 10MO sec c'est que c est bridé
PowerShell Admin >
\$netadapter=Get-NetAdapter -IncludeHidden -Name "vEthernet (WSL*"
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound -InterfaceAlias \$netadapter.Name -Action Allow
// relancer le curl

Plus d info
https://www.jetbrains.com/help/idea/how-to-use-wsl-development-environment-in-product.html#debugging_system_settings
https://gist.github.com/pgorod/3484b7764e4575f8f3ee8c68bea52c30
https://stackoverflow.com/questions/67116880/how-to-correctly-set-up-intellij-with-wsl2

____HERE
