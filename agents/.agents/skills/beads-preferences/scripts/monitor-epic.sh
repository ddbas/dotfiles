#!/usr/bin/env bash
# Open a detached tmux window in the current session that watches a bead epic.
# Usage: monitor-epic.sh <epic-id>
set -euo pipefail

if [[ $# -ne 1 || -z "$1" ]]; then
  echo "Usage: monitor-epic.sh <epic-id>" >&2
  exit 2
fi
epic_id="$1"

if [[ -z "${TMUX_PANE:-}" ]]; then
  echo "Error: not running inside tmux (TMUX_PANE is unset); no window created." >&2
  exit 1
fi

if ! bd show "$epic_id" >/dev/null 2>&1; then
  echo "Error: bead '$epic_id' not found; no window created." >&2
  exit 1
fi

window_name="watch-$epic_id"

# tmux resolves the session from TMUX_PANE, so these target the agent's own session.
if tmux list-windows -F '#{window_name}' | grep -Fxq -- "$window_name"; then
  echo "Window already exists: $window_name"
  exit 0
fi

# -d: do not switch the client to the new window.
printf -v watch_cmd 'bd list --parent %q --all --watch' "$epic_id"
tmux new-window -d -n "$window_name" -c "$PWD" "$watch_cmd"
echo "Created window: $window_name"
