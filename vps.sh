#################################

# To use it, need to do this first :
# git clone https://github.com/Hettomei/my_computer_conf.git
# ./my_computer_conf/start_vps.sh

# Si y a un pb avec sudo serveur not found serveur-1
# faire
# sudo vim /etc/hosts
# et ajouter
# 127.0.0.1 serveur-1

set -ex

sudo su

## neovim
cd
sudo apt update
sudo apt install --yes libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
alias g=git
g clone https://github.com/neovim/neovim
alias v=nvim

brew install ag
brew install diff-so-fancy

# conf nvim
# echo "run ./my_computer_conf/save_nvim.sh"

# java 8
# cd
# add-apt-repository --yes ppa:webupd8team/java
# apt update
# apt install --yes oracle-java8-installer
# java -version


# docker
# cd
# apt install --yes  apt-transport-https ca-certificates
# sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' > /etc/apt/sources.list.d/docker.list
# apt update
# apt install --yes linux-image-extra-$(uname -r) linux-image-extra-virtual
# apt install --yes docker-engine
# service docker start
# docker run clojure
