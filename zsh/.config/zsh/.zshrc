#!/bin/zsh

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/brewfile/Brewfile

# Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Editor
if [ -x "$(command -v nvim)" ]; then
  export VISUAL=nvim
fi

# Setup autocomplete
autoload -U compinit; compinit

source $XDG_CONFIG_HOME/zsh/plugins/fnm.zsh
source $XDG_CONFIG_HOME/zsh/plugins/fzf.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting.zsh

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$XDG_CONFIG_HOME/npm/node_modules/.bin
export BAT_THEME="everforest-dark"
export PS1="%B%F{green}>%f%b "

# Work
if [ -f $XDG_CONFIG_HOME/work/zsh/.zshrc ]; then
  source $XDG_CONFIG_HOME/work/zsh/.zshrc
fi

# Aliases
alias gb='git branch'
alias gs='git status'
alias ll='eza -la'
