#!/bin/zsh

# XDG
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/share

# Path
export PATH="$PATH:$HOME/.local/bin:$XDG_CONFIG_HOME/npm/node_modules/.bin"

# Editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Homebrew
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/brewfile/Brewfile

# Customizations
export CUSTOMIZATIONS_DIR=$XDG_CONFIG_HOME/custom
