#!/usr/bin/env bash

# Install ZSH
ln -s $PWD/zsh/.zshrc ~/.zshrc

# Install TMUX
ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf

# Install Alacritty
ln -s $PWD/alacritty/.alacritty.yml ~/.alacritty.yml

# Install VIM
ln -s $PWD/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/scripts
ln -s $PWD/vim/bracketed-paste.vim ~/.vim/scripts/bracketed-paste.vim

# Install Helix
mkdir -p ~/.config/helix/
ln -s $PWD/helix/config.toml ~/.config/helix/config.toml

# Install scripts
mkdir -p ~/.local
ln -s $PWD/bin ~/.local/bin