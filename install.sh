#!/usr/bin/env bash

if ! test -f ~/.zshrc; then
    echo "Install zsh"
    ln -s $PWD/zsh/.zshrc ~/.zshrc
fi

if ! test -f ~/.tmux.conf; then
    echo "Install tmux"
    ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
fi

if ! test -f ~/.alacritty.yml; then
    echo "Install alacritty"
    ln -s $PWD/alacritty/.alacritty.yml ~/.alacritty.yml
fi

if ! test -f ~/.vim/scripts/bracketed-paste.vim; then
    echo "Install vim"
    ln -s $PWD/vim/.vimrc ~/.vimrc
    mkdir -p ~/.vim/scripts
    ln -s $PWD/vim/bracketed-paste.vim ~/.vim/scripts/bracketed-paste.vim
fi

if [ ! -d ~/.config/helix ]; then
    echo "Install helix"
    mkdir -p ~/.config
    ln -s $PWD/helix ~/.config/helix
fi

if [ ! -d ~/.local/bin ]; then
    echo "Install scripts"
    mkdir -p ~/.local
    ln -s $PWD/bin ~/.local/bin
fi