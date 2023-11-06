#!/usr/bin/env bash

# Configurations
stow --verbose --delete --dotfiles --target ~ home

# Tmux
if [ -d ~/.local/share/tmux ]; then
    rm -rf ~/.local/share/tmux 2> /dev/null
fi
if [ -d ~/.local/share/tmux ]; then
    rm -rf ~/.local/share/tmux 2> /dev/null
fi
