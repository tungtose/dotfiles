#!/bin/sh

# Install grep
sudo apt install ripgrep

# Install NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
./nvim.appimage

# Ubuntu
# sudo apt-get install software-properties-common

# Python
sudo apt-get install python-dev python-pip python3-dev python3-pip

# VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

