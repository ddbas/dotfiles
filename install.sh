#!/usr/bin/env bash
echo "Install nix packages"
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-env -irf user.nix

echo "Install configurations"
if ! test -f ~/.zshrc; then
    echo "zsh"
    ln -s $PWD/zsh/.zshrc ~/.zshrc
fi

if ! test -f ~/.tmux.conf; then
    echo "tmux"
    ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
fi

if ! test -f ~/.alacritty.yml; then
    echo "alacritty"
    ln -s $PWD/alacritty/.alacritty.yml ~/.alacritty.yml
fi

if [ ! -d ~/.config/helix ]; then
    echo "helix"
    mkdir -p ~/.config
    ln -s $PWD/helix ~/.config/helix
fi

echo "Install scripts"
if [ ! -d ~/.local/bin ]; then
    mkdir -p ~/.local
    ln -s $PWD/bin ~/.local/bin
fi
