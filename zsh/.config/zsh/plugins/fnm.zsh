#!/bin/zsh
if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env)"
fi
