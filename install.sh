#!/usr/bin/env bash

# TODO: Check if the file exists first.

echo "Install zsh"
ln -s $PWD/zsh/.zshrc ~/.zshrc

echo "Install tmux"
ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf

echo "Install alacritty"
ln -s $PWD/alacritty/.alacritty.yml ~/.alacritty.yml

echo "Install vim"
ln -s $PWD/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/scripts
ln -s $PWD/vim/bracketed-paste.vim ~/.vim/scripts/bracketed-paste.vim

echo "Install helix"
mkdir -p ~/.config/helix/
ln -s $PWD/helix/config.toml ~/.config/helix/config.toml

echo "Install scripts"
mkdir -p ~/.local
ln -s $PWD/bin ~/.local/bin