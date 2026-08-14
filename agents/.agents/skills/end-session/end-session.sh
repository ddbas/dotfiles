#!/usr/bin/env bash
set -euo pipefail

if [ -z "${TMUX:-}" ]; then
  echo "Not inside a tmux session; nothing to do." >&2
  exit 1
fi

window_count=$(tmux list-windows | wc -l)

if [ "$window_count" -le 1 ]; then
  tmux new-window -d
fi

tmux kill-window
