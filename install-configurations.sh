#!/usr/bin/env bash

# Configurations
stow --verbose --dotfiles --target ~ stow

# Tmux
if [ ! -d ~/.local/share/tmux ]; then
    mkdir -p ~/.local/share/tmux
    git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
fi
if [ ! -f ~/.local/share/terminfo/74/tmux-256color ]; then
  # https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
  $(brew --prefix)/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
  sed -i '' -e 's/pairs#0x10000/pairs#32767/g' ~/tmux-256color.src
  sed -i '' -e 's/pairs#65536/pairs#32767/g' ~/tmux-256color.src
  mkdir -p ~/.local/share
  /usr/bin/tic -x -o $HOME/.local/share/terminfo ~/tmux-256color.src
  rm ~/tmux-256color.src
fi

# FZF
if [ -x "$(command -v fzf)" ]; then
  $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
fi