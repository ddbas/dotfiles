#!/usr/bin/env bash
INPUT=$(cat)

# Stop/StopFailure fire once per main-agent turn, including brief turns spent
# just relaying a background subagent's progress. Skip those — only notify
# once nothing is still running in the background.
PENDING=$(echo "$INPUT" | jq '(.background_tasks // []) | length')
[[ "$PENDING" -gt 0 ]] && exit 0

MSG=$(echo "$INPUT" | jq -r '.message // empty')
if [[ -z "$MSG" ]]; then
  case "$(echo "$INPUT" | jq -r '.hook_event_name // empty')" in
    StopFailure) MSG="Turn ended due to an error" ;;
    *) MSG="Claude finished responding" ;;
  esac
fi

SESSION=""
if [[ -n "$TMUX" ]]; then
  SESSION=$(tmux display-message -p '#S' 2>/dev/null)
fi

TITLE="Claude Code"
[[ -n "$SESSION" ]] && TITLE="Claude Code — ${SESSION}"

osascript -e 'on run argv
  display notification (item 1 of argv) with title (item 2 of argv) sound name "Submarine"
end run' "$MSG" "$TITLE"
