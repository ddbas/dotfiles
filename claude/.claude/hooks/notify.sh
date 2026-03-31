#!/usr/bin/env bash
INPUT=$(cat)
MSG=$(echo "$INPUT" | jq -r '.message')
osascript -e "display notification \"$MSG\" with title \"Claude Code\" sound name \"Submarine\""
