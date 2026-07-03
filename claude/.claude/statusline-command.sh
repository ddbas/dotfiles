#!/usr/bin/env bash
# Claude Code statusLine command
# Displays: model name | context usage with Unicode block progress bar

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown model"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

if [ -n "$used" ]; then
  # Build a 10-block progress bar using Unicode block characters
  filled=$(echo "$used" | awk '{printf "%d", int($1 / 10 + 0.5)}')
  bar=""
  for i in $(seq 1 10); do
    if [ "$i" -le "$filled" ]; then
      bar="${bar}█"
    else
      bar="${bar}░"
    fi
  done
  used_int=$(echo "$used" | awk '{printf "%.0f", $1}')

  # Color the bar: green <= 60%, yellow <= 85%, red > 85%
  if [ "$used_int" -le 60 ]; then
    color="\033[32m"   # green
  elif [ "$used_int" -le 85 ]; then
    color="\033[33m"   # yellow
  else
    color="\033[31m"   # red
  fi
  reset="\033[0m"

  printf "%s  ${color}%s${reset} %s%%" "$model" "$bar" "$used_int"
else
  printf "%s" "$model"
fi
