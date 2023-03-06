#!/usr/bin/env bash
echo "Uninstall scripts"
if [ -L ~/.local/bin ]; then
    rm -rf ~/.local/bin 2> /dev/null
fi

echo "Uninstall configurations"
if [ -L ~/.zshrc ]; then
    echo "zsh"
    rm ~/.zshrc 2> /dev/null
fi

if [ -L ~/.tmux.conf ]; then
    echo "tmux"
    rm ~/.tmux.conf 2> /dev/null
fi

if [ -L ~/.alacritty.yml ]; then
    echo "alacritty"
    rm ~/.alacritty.yml 2> /dev/null
fi

if [ -L ~/.gitconfig ] && [ -L ~/.gitmessage ]; then # if symbolic link
    echo "git"
    rm ~/.gitconfig 2> /dev/null
    rm ~/.gitmessage 2> /dev/null
fi

if [ -L ~/.config/helix ]; then
    echo "helix"
    rm -rf ~/.config/helix 2> /dev/null
fi
