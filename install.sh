#!/usr/bin/env bash
echo "Install configurations"
if [ ! -f ~/.zshrc ]; then
    echo "zsh"
    ln -s $PWD/zsh/.zshrc ~/.zshrc
fi

if [ ! -f ~/.tmux.conf ]; then
    echo "tmux"
    ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
fi

if [ ! -f ~/.alacritty.yml ]; then
    echo "alacritty"
    ln -s $PWD/alacritty/.alacritty.yml ~/.alacritty.yml
fi

if [ ! -f ~/.gitconfig ] && [ ! -f ~/.gitmessage ]; then
    echo "git"
    ln -s $PWD/git/git-config ~/.gitconfig
    ln -s $PWD/git/git-message ~/.gitmessage
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
