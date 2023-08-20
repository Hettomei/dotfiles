# do this X 3
pacman -Suy

pacman -S msys/openssh msys/git ucrt64/mingw-w64-ucrt-x86_64-rclone ucrt64/mingw-w64-ucrt-x86_64-fd ucrt64/mingw-w64-ucrt-x86_64-ripgrep

# extracted from https://gist.github.com/equalsraf/6cc26951981fa254b53a80cf73eaf47d 
# then adapted with ucrt "windows build nvim"
pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-libtool mingw-w64-ucrt-x86_64-cmake \
mingw-w64-ucrt-x86_64-make mingw-w64-ucrt-x86_64-perl mingw-w64-ucrt-x86_64-python2 \
mingw-w64-ucrt-x86_64-pkg-config mingw-w64-ucrt-x86_64-unibilium gperf
