#!/bin/sh

#Exa
sudo add-apt-repository ppa:spvkgn/exa -y
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update -y
sudo apt install exa -y
sudo apt-get update -y
# Install NeoVim
sudo apt-get install -y neovim

# Install grep
sudo apt install ripgrep

# g++
sudo apt install g++ -y

# VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Python
sudo apt-get install python-dev python-pip python3-dev python3-pip -y


# Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
source ~/.zshrc

