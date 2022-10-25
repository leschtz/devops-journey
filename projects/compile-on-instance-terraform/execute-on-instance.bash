#!/bin/bash +x

sudo apt update

sudo apt install -y git gcc autoconf make
sudo apt install -y libncurses-dev 

git clone git://git.code.sf.net/p/zsh/code zsh
cd zsh
./Util/preconfig
./configure --disable-dynamic # create a standalone binary

make
make check 
