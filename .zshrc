# Start tmux
[[ -z "$TMUX" ]] && exec tmux

# Prompt Settings (http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '%K{5} ('$branch') '
    fi
}
setopt prompt_subst
PROMPT='%B%K{4} %3~ $(git_branch)%k%b '
# RPROMPT can also be used for a right-side prompt

# NVM Setup
function _install_nvm() {
  unset -f nvm npm node
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  "$@"
}

function nvm() {
    _install_nvm nvm "$@"
}

function npm() {
    _install_nvm npm "$@"
}

function node() {
    _install_nvm node "$@"
}

# Environment Variables
export GREP_OPTIONS='--color=auto'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--border=rounded --color='border:2'"
