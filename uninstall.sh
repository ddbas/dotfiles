#!/usr/bin/env bash
echo "Uninstall configurations"

echo "zsh"
rm ~/.zshrc 2> /dev/null

echo "tmux"
rm ~/.tmux.conf 2> /dev/null

echo "alacritty"
rm ~/.alacritty.yml 2> /dev/null

echo "helix"
rm -rf ~/.config/helix 2> /dev/null

echo "Uninstall scripts"
rm -rf ~/.local/bin 2> /dev/null

echo "Uninstall nix packages"
nix-env -e '.*'
