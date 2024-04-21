#!/bin/bash

cd ~/

echo 'Installing dependencies...'
brew install stow
brew install zsh
brew install git
brew install curl
brew install ripgrep
brew install fd
brew install fontconfig

echo 'Installing asdf'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo 'Installing nerd-fonts...'
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i JetBrainsMono

echo 'Installing tmux...'
brew install tmux
rm -rf ~/.tmux.conf

echo 'Installing neovim...'
brew install neovim
rm -rf ~/.config/nvim

echo 'Installing starship...'
touch ~/.zshrc
brew install starship
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
rm -rf ~/.zshrc

stow .
