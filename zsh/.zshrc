#!/bin/zsh

export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# Brew
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/brewfile/Brewfile
if [ -f /usr/local/bin/brew ]; then
    # Intel MacOS
    eval "$(/usr/local/bin/brew shellenv)"
elif [ -f /opt/homebrew/bin/brew ]; then
    # ARM MacOS
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Starship
eval "$(starship init zsh)"

# ZSH plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup autocompletion system
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
else
    compinit -C
fi

# Default editor
if [ -x "$(command -v nvim)" ]; then
    export VISUAL=nvim
else
    echo "Error: nvim is not installed"
fi

# FZF
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git" --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --exclude .git . "$1"
}

# FNM
if [ -x "$(command -v fnm)" ]; then
    eval "$(fnm env --log-level quiet --use-on-cd)"
else
    echo "Error: fnm is not installed"
fi

# Bat
export BAT_THEME="Nord"

# Other environment variables
if [ -f ~/.env.zsh ]; then
    source ~/.env.zsh
fi

# Secrets
if [ -f ~/.secrets.zsh ]; then
    source ~/.secrets.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
