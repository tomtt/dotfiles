#! /bin/sh

VIMPLUG=~/.vim/autoload/plug.vim
if [ ! -f "$VIMPLUG" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -v ./vim/.vimrc ~/.vimrc
ln -v ./.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

vim +PlugInstall
