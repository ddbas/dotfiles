#!/bin/zsh
if [ -x "$(command -v fnm)" ]; then
  # https://github.com/Schniz/fnm?tab=readme-ov-file#zsh
  eval "$(fnm env --use-on-cd --shell zsh)"
fi
