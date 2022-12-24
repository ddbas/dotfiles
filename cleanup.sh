#!/usr/bin/env bash

echo "Uninstall zsh"
rm ~/.zshrc 2> /dev/null

echo "Uninstall tmux"
rm ~/.tmux.conf 2> /dev/null

echo "Uninstall alacritty"
rm ~/.alacritty.yml 2> /dev/null

echo "Uninstall vim"
rm ~/.vim/scripts/bracketed-paste.vim 2> /dev/null
rm ~/.vimrc 2> /dev/null

echo "Uninstall helix"
rm -rf ~/.config/helix 2> /dev/null

echo "Uninstall scripts"
rm -rf ~/.local/bin 2> /dev/null
