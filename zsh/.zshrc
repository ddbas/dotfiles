export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share

# Initialize brew
if [ -f /usr/local/bin/brew ]; then
    # Intel MacOS
    eval "$(/usr/local/bin/brew shellenv)"
else
    # ARM MacOS
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Start tmux
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo # See https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
[[ -z "$TMUX" ]] && exec tmux

# Binaries
export PATH="$PATH:~/.local/bin"

# Setup prompt
eval "$(starship init zsh)"

# Setup autocompletion system
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
else
    compinit -C
fi

# Default editor
export VISUAL=hx

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=\!.git/'
export FZF_DEFAULT_OPTS="--border=rounded --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4" # Dracula theme
export FZF_CTRL_T_COMMAND='fd --hidden --exclude ".git"'
export FZF_CTRL_T_OPTS="--border=rounded --color='border:12'"

# FNM
eval "$(fnm env --log-level quiet --use-on-cd)"

# Other Environment Variables
if [[ -a ~/.env.zsh ]]
then
    source ~/.env.zsh
fi

# Secrets
if [[ -a ~/.secrets.zsh ]]
then
    source ~/.secrets.zsh
fi
