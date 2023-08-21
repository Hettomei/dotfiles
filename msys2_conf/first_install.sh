# do this X 3
pacman -Suy

pacman -S ucrt64/mingw-w64-ucrt-x86_64-neovim \
  msys/openssh msys/tmux msys/git \
  ucrt64/mingw-w64-ucrt-x86_64-rclone ucrt64/mingw-w64-ucrt-x86_64-fd \
  ucrt64/mingw-w64-ucrt-x86_64-ripgrep

pacman -S --noconfirm --needed mingw-w64-ucrt-x86_64-toolchain

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
