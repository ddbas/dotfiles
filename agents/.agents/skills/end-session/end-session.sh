#!/usr/bin/env bash
set -euo pipefail

if [ -z "${TMUX:-}" ]; then
  echo "Not inside a tmux session; nothing to do." >&2
  exit 1
fi

tmux new-window -d
tmux kill-window
