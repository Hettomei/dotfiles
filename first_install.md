sudo apt install --yes build-essential curl git tmux xclip keepassxc ripgrep

<!-- pour python / pyenv : -->

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev


https://github.com/doomemacs/doomemacs#install
https://github.com/pyenv/pyenv


# Pour msys2 :

Utiliser UCRT64.bin, c est verifié

pacman -Syu

## pas avec pacboy

pacman -S pactoys
pacman -S tmux
pacman -S git
pacman -S gvim
pacman -S vim
pacman -S unzip

## avec pacboy

pacboy update
pacboy -S fd ripgrep neovim
pacboy -S make ninja cmake autotools
pacboy -S emacs
