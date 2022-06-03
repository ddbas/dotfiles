#!/usr/bin/env bash

# Remove ZSH
rm ~/.zshrc 2> /dev/null

# Remove TMUX
rm ~/.tmux.conf 2> /dev/null

# Remove Alacritty
rm ~/.alacritty.yml 2> /dev/null

# Remove VIM
rm ~/.vim/scripts/bracketed-paste.vim 2> /dev/null
rm ~/.vimrc 2> /dev/null

# Remove Helix
rm ~/.config/helix/config.toml 2> /dev/null

# Remove scripts
rm -rf ~/.local/bin 2> /dev/null
