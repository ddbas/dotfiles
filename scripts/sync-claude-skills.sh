#!/usr/bin/env bash
# Symlink every skill under agents/.agents/skills/ into
# claude/.claude/skills/personal/skills/, one symlink per skill folder.
#
# This is a *separate* use of GNU Stow from the one in install.sh (which
# stows this repo into $HOME): here we stow within the repo itself, from
# agents/.agents/skills into claude/.claude/skills/personal/skills.
#
# Run manually, or automatically via the lefthook pre-commit hook whenever
# agents/.agents/skills/** changes.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

src_dir="$repo_root/agents/.agents"       # stow dir (holds the "skills" package)
src_pkg="skills"                          # package name == agents/.agents/skills
dst_dir="$repo_root/claude/.claude/skills/personal/skills"

# Skills listed here (one name per line, '#' comments allowed) are kept
# generic-only and never mirrored into Claude's personal skills folder.
exclude_file="$repo_root/scripts/claude-skills-exclude.txt"

mkdir -p "$dst_dir"

ignore_args=()
if [[ -f "$exclude_file" ]]; then
  while IFS= read -r name; do
    [[ -z "$name" || "$name" == \#* ]] && continue
    ignore_args+=(--ignore="^${name}$")
  done < "$exclude_file"
fi

# --restow (-R): drop-and-relink, so this is idempotent and also fixes up
# any skill whose symlink target changed.
stow --dir="$src_dir" --target="$dst_dir" --restow \
  "${ignore_args[@]+"${ignore_args[@]}"}" "$src_pkg"

# Prune symlinks left behind for skills that were removed from agents/.
find "$dst_dir" -maxdepth 1 -type l ! -exec test -e {} \; -delete

# Stage the result so the symlinks are part of the same commit.
git -C "$repo_root" add -A -- "$dst_dir"
