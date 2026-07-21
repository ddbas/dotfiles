#!/usr/bin/env bash
INPUT=$(cat)
MSG=$(echo "$INPUT" | jq -r '.message')

SESSION=""
if [[ -n "$TMUX" ]]; then
  SESSION=$(tmux display-message -p '#S' 2>/dev/null)
fi

TITLE="Claude Code"
[[ -n "$SESSION" ]] && TITLE="Claude Code — ${SESSION}"

osascript -e 'on run argv
  display notification (item 1 of argv) with title (item 2 of argv) sound name "Submarine"
end run' "$MSG" "$TITLE"
