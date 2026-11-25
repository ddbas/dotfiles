#!/usr/bin/env bash
# Symlink every skill under agents/.agents/skills/ into
# claude/.claude/skills/personal/skills/, one symlink per skill folder.
#
# Run manually, or automatically via the lefthook pre-commit hook whenever
# agents/.agents/skills/** changes.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

src_dir="$repo_root/agents/.agents"
src_pkg="skills"
dst_dir="$repo_root/claude/.claude/skills/personal/skills"

# Skills listed here (one name per line, '#' comments allowed) are kept
# generic-only and never mirrored into Claude's personal skills folder.
exclude_file="$repo_root/scripts/claude-skills-exclude.txt"

mkdir -p "$dst_dir"

# Relink every skill folder (idempotent; also fixes a changed target).
skills_dir="$src_dir/$src_pkg"
rel_prefix="../../../../../agents/.agents/$src_pkg"
for skill in "$skills_dir"/*/; do
  name="$(basename "$skill")"
  if [[ -f "$exclude_file" ]] && grep -qxF "$name" <(grep -v '^[[:space:]]*#' "$exclude_file"); then
    continue
  fi
  ln -sfn "$rel_prefix/$name" "$dst_dir/$name"
done

# Prune symlinks left behind for skills that were removed from agents/.
find "$dst_dir" -maxdepth 1 -type l ! -exec test -e {} \; -delete

# Stage the result so the symlinks are part of the same commit.
git -C "$repo_root" add -A -- "$dst_dir"
