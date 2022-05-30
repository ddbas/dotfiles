# Start tmux
[[ -z "$TMUX" ]] && exec tmux

# Prompt
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '%F{4} ('$branch')'
    fi
}
setopt prompt_subst
PROMPT='%B%F{12} %1~$(git_branch)%f%b > '
# Colors cheatsheet: https://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

# Setup autocompletion system
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
else
    compinit -C
fi

# Path
PATH=$PATH:~/.local/bin

# Editor
export VISUAL=/Users/bastied/.cargo/bin/hx

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=\!.git/'
export FZF_DEFAULT_OPTS="--border=rounded --color='border:12'"
export FZF_CTRL_T_COMMAND='rg --files --hidden --glob=\!.git/'
export FZF_CTRL_T_OPTS="--border=rounded --color='border:12'"

# NVM
function _install_nvm() {
    unset -f nvm npx node npm yarn
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    "$@"
}

function nvm() {
    _install_nvm nvm "$@"
}

function npx() {
    _install_nvm npx "$@"
}

function node() {
    _install_nvm node "$@"
}

function npm() {
    _install_nvm npm "$@"
}

function yarn() {
    _install_nvm yarn "$@"
}

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
