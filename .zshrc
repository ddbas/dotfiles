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

# Environment Variables
export GREP_OPTIONS='--color=auto'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
