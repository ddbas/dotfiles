#!/usr/bin/env bash

# Configurations
stow --verbose --dotfiles --target ~ home

# Tmux
if [ ! -d ~/.local/share/tmux ]; then
    mkdir -p ~/.local/share/tmux
    git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
fi
