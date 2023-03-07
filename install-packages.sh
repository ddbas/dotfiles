#!/usr/bin/env bash
echo "Install packages"
brew install alacritty
    tmux \
    exa \
    fd \
    fnm \
    fzf \
    git \
    helix \
    ripgrep \
    tree \
    rust-analyzer

# Additional setup
## Tmux
$(brew --prefix)/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
sed -i '' -e 's/pairs#0x10000/pairs#32767/g' ~/tmux-256color.src
sed -i '' -e 's/pairs#65536/pairs#32767/g' ~/tmux-256color.src
mkdir -p ~/.local/share
/usr/bin/tic -x -o $HOME/.local/share/terminfo ~/tmux-256color.src
rm ~/tmux-256color.src

## FZF
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
