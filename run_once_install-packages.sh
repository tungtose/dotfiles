#!/bin/sh
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y

# Install NeoVim
sudo apt-get install -y neovim

# Install grep
sudo apt-get install ripgrep -y

# g++
sudo apt install g++ -y

# Python
# sudo apt-get install python-dev python-pip python3-dev python3-pip -y

# Zsh
# sudo apt install zsh -y
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# source ~/.zshrc
