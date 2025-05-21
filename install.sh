#!/bin/sh
set -e

# Install dependencies
sudo apt-get update
sudo apt-get install -y zsh curl git tmux

# Install ZSH plugins
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install Zoxide
# curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install Neovim
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

# Install Kitty (optional, for SSH sessions)
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin


# Symlink dotfiles
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
mkdir -p $HOME/.config
# ln -sf $HOME/dotfiles/.config/kitty $HOME/.config/kitty
ln -sf $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml
ln -sf $HOME/dotfiles/.config/nvim $HOME/.config/nvim

# Change default shell to ZSH
sudo chsh -s /usr/bin/zsh $(whoami)

# Install language-specific tools
# Node.js (for Angular, React, NextJS, VitePress)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install -g @angular/cli create-react-app next vite

# Go
# wget https://go.dev/dl/go1.20.7.linux-amd64.tar.gz
# sudo tar -C /usr/local -xzf go1.20.7.linux-amd64.tar.gz
# rm go1.20.7.linux-amd64.tar.gz
# export PATH=$PATH:/usr/local/go/bin

# Python
# sudo apt-get install -y python3 python3-pip python3-venv
# pip3 install black isort

# Log installation
echo "Dotfiles installation completed" >> ~/install.log
