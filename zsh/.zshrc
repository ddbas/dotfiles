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

# Prompt
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '%F{2} ('$branch')'
    fi
}
setopt prompt_subst
PROMPT='%B%F{6} %1~$(git_branch)%f%b > '
# Colors cheatsheet: https://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

# Setup autocompletion system
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
else
    compinit -C
fi

# Default editor
export VISUAL=hx

# Path
PATH=$PATH:~/.local/bin

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=\!.git/'
export FZF_DEFAULT_OPTS="--border=rounded --color='border:12,bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'"
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
