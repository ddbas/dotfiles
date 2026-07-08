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
source $XDG_CONFIG_HOME/zsh/plugins/mise.zsh
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

# kiln credentials
set -a
source "/Users/davidbastien/repos/kiln-tyto-workspace/.env"
set +a

# kiln workspace launcher
start-kiln() {
  cd "/Users/davidbastien/repos/kiln-tyto-workspace" || return
  kiln auth refresh --provider jira-cloud >/dev/null 2>&1 || kiln auth login --provider jira-cloud
  kiln --accept-danger
}
