#!/usr/bin/env bash
# Closes the tmux window this script runs in (the agent's own window).
# The tmux session is preserved: a replacement window is only created when
# the window being closed is the last one in the session.
set -euo pipefail

if [ -z "${TMUX:-}" ] || [ -z "${TMUX_PANE:-}" ]; then
  echo "Not inside a tmux pane; nothing to do." >&2
  exit 1
fi

# Target by pane id so we act on this agent's window/session, not whichever
# client was most recently active.
window_id=$(tmux display-message -p -t "$TMUX_PANE" '#{window_id}')
session_id=$(tmux display-message -p -t "$TMUX_PANE" '#{session_id}')
window_count=$(tmux list-windows -t "$session_id" | wc -l)

if [ "$window_count" -le 1 ]; then
  tmux new-window -d -t "$session_id:"
fi

tmux kill-window -t "$window_id"
