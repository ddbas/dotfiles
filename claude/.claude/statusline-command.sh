#!/usr/bin/env bash
# Claude Code statusLine command
# Displays: model name | context usage bar | git branch + working-tree state

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown model"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
session_id=$(echo "$input" | jq -r '.session_id // "default"')

reset="\033[0m"

# --- Git segment -------------------------------------------------------------
# Output of the (possibly slow) git call is cached for 5s per session, as in the
# official statusline docs. --no-optional-locks keeps git status read-only so it
# never takes index.lock and can't interfere with agents' own git commands.
git_fields() {
  local cache="/tmp/statusline-git-cache-${session_id}"
  local now mtime
  now=$(date +%s)
  if [ -f "$cache" ]; then
    mtime=$(stat -f %m "$cache" 2>/dev/null || stat -c %Y "$cache" 2>/dev/null || echo 0)
    if [ $((now - mtime)) -lt 5 ]; then
      cat "$cache"
      return
    fi
  fi
  local out=""
  if [ -n "$dir" ]; then
    # Fields: branch staged modified untracked ahead behind
    out=$(git --no-optional-locks -C "$dir" status --porcelain=v2 --branch 2>/dev/null | awk '
      /^# branch.oid/  { oid = substr($3, 1, 7) }
      /^# branch.head/ { head = $3 }
      /^# branch.ab/   { ahead = substr($3, 2); behind = substr($4, 2) }
      /^[12u] /        { x = substr($2, 1, 1); y = substr($2, 2, 1)
                         if (x != ".") s++
                         if (y != ".") m++ }
      /^\? /           { u++ }
      END {
        if (head == "") exit
        if (head == "(detached)") head = oid
        printf "%s %d %d %d %d %d", head, s, m, u, ahead, behind
      }')
  fi
  printf "%s" "$out" > "$cache"
  printf "%s" "$out"
}

git_segment=""
fields=$(git_fields)
if [ -n "$fields" ]; then
  read -r branch staged modified untracked ahead behind <<< "$fields"
  git_segment="  \033[36m${branch}${reset}"
  [ "$staged" -gt 0 ]    && git_segment="${git_segment} \033[32m+${staged}${reset}"
  [ "$modified" -gt 0 ]  && git_segment="${git_segment} \033[33m~${modified}${reset}"
  [ "$untracked" -gt 0 ] && git_segment="${git_segment} \033[31m?${untracked}${reset}"
  if [ "$ahead" -gt 0 ] || [ "$behind" -gt 0 ]; then
    git_segment="${git_segment} \033[36m↑${ahead}↓${behind}${reset}"
  fi
fi

# --- Context bar -------------------------------------------------------------
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

  printf "%s  ${color}%s${reset} %s%%${git_segment}" "$model" "$bar" "$used_int"
else
  printf "%s${git_segment}" "$model"
fi
