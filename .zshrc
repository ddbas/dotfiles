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

# Environment Variables
export GREP_OPTIONS='--color=auto'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Git Autocompletion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit
