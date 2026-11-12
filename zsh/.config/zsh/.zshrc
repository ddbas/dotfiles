#!/bin/zsh

# Cache helper
source $XDG_CONFIG_HOME/zsh/lib/cache.zsh

# Brew
_cache_init brew /opt/homebrew/bin/brew shellenv

# Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Setup autocomplete
autoload -Uz compinit
() {
  setopt local_options extendedglob # needed for the (#q...) qualifier
  if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit # full rebuild + audit, at most daily
  else
    compinit -C # trust the cache
  fi
}
source $XDG_CONFIG_HOME/zsh/plugins/fnm.zsh
source $XDG_CONFIG_HOME/zsh/plugins/fzf.zsh
source $XDG_CONFIG_HOME/zsh/plugins/mise.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting.zsh

# Theme & prompt
export BAT_THEME="everforest-dark"
export PS1="%B%F{green}>%f%b "

# Options
setopt interactivecomments # Enables `#` comments in zsh

# Aliases
alias cc='claude'
alias gb='git branch'
alias gs='git status'
alias ll='eza -la'

# Customizations
if [ -f $CUSTOMIZATIONS_DIR/zsh/.zshrc ]; then
  source $CUSTOMIZATIONS_DIR/zsh/.zshrc
fi
