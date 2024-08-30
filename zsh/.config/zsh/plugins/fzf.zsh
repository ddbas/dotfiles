#!/bin/zsh
export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git" --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
eval "$(fzf --zsh)"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --exclude .git . "$1"
}
