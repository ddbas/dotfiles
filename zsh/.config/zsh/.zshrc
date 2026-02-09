#!/bin/zsh

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Setup autocomplete
autoload -U compinit; compinit
source $XDG_CONFIG_HOME/zsh/plugins/fnm.zsh
source $XDG_CONFIG_HOME/zsh/plugins/fzf.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting.zsh

# Theme & prompt
export BAT_THEME="everforest-dark"
export PS1="%B%F{green}>%f%b "

# Aliases
alias gb='git branch'
alias gs='git status'
alias ll='eza -la'

# Customizations
if [ -f $CUSTOMIZATIONS_DIR/zsh/.zshrc ]; then
  source $CUSTOMIZATIONS_DIR/zsh/.zshrc
fi
