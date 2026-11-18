#!/usr/bin/env bash
# Closes the tmux window this script runs in (the agent's own window), or,
# with --kill-tmux-session, the agent's entire tmux session.
#
# Default: the tmux session is preserved. A replacement window is only created
# when the window being closed is the last one in the session.
set -euo pipefail

usage() { echo "Usage: $0 [--kill-tmux-session]" >&2; }

kill_tmux_session=false
case "${1:-}" in
  "") ;;
  --kill-tmux-session) kill_tmux_session=true ;;
  *) usage; exit 2 ;;
esac
[ $# -le 1 ] || { usage; exit 2; }

if [ -z "${TMUX:-}" ] || [ -z "${TMUX_PANE:-}" ]; then
  echo "Not inside a tmux pane; nothing to do." >&2
  exit 1
fi

# Target by pane id so we act on this agent's window/session, not whichever
# client was most recently active.
session_id=$(tmux display-message -p -t "$TMUX_PANE" '#{session_id}')

if $kill_tmux_session; then
  tmux kill-session -t "$session_id"
  exit 0
fi

window_id=$(tmux display-message -p -t "$TMUX_PANE" '#{window_id}')
window_count=$(tmux list-windows -t "$session_id" | wc -l)

if [ "$window_count" -le 1 ]; then
  tmux new-window -d -t "$session_id:"
fi

tmux kill-window -t "$window_id"
