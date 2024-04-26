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
rm -rf ~/.zshrc

echo 'Installing zap...'
rm -rf ~/.zshrc
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)

echo 'Linking dot files...'
cd ~/dotfiles
stow .

echo ''
read -p "Do you like to configure Github ssh? (y/n): " confirm && [[ $confirm == [yY] ]] || exit 1
sh configure_git.sh
