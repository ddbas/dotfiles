#!/usr/bin/env bash
# Prints pre-PR info: branch, base branch, PR templates, existing open PRs.
set -u

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || { echo "error: not a git repo" >&2; exit 1; }
root=$(git rev-parse --show-toplevel)
cd "$root" || exit 1

base=$(gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name' 2>/dev/null)
base=${base:-main}

echo "branch: $branch"
echo "base: $base"

echo "templates:"
found=0
for f in pull_request_template.md \
         .github/pull_request_template.md \
         .github/PULL_REQUEST_TEMPLATE/pull_request_template.md; do
  [ -f "$f" ] && { echo "  $f"; found=1; }
done
[ "$found" = 0 ] && echo "  none"

echo "open_prs:"
prs=$(gh pr list --head "$branch" --state open --json number,title,url \
      --jq '.[] | "  #\(.number) \(.title) \(.url)"' 2>/dev/null)
echo "${prs:-  none}"
