---
name: git-merge
description: Merging another branch (default: trunk) into the current branch with conflict resolution and regression validation
---

# Git Merge

## Process

1. Determine the source branch: use the branch name the user gave; if none was given, default to the repository's trunk branch (`gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'`, falling back to `main` if that fails).
2. Confirm the working tree is clean (`git status`). If there are uncommitted changes, stop and ask the user how to proceed rather than merging over them.
3. `git merge --no-commit <source-branch>`. `--no-commit` holds off the commit in both the clean and conflicting case, so validation always happens before anything is committed.
4. If there are conflicts, resolve them file by file:
   - Read both sides of each conflict, plus surrounding context (commit messages, related code, tests) to understand what each branch was actually trying to do.
   - Use judgment, not a fixed rule: if the current branch is deliberately changing behavior that the source branch also touched, prefer the current branch's intent for that change rather than mechanically keeping both. If the two sides are unrelated or additive, preserve both. The goal is the correct resulting behavior, not maximal preservation of every line.
   - Stage each resolved file with `git add`.
5. Validate the merged result: build, lint, and run the test suite (check CLAUDE.md, package.json, or equivalent for the right commands). Confirm the merge behaves correctly — a clean conflict resolution that regresses intended behavior on either side is not done. Fix anything broken and re-validate before continuing.
6. Once validation passes, finalize the merge commit: `git commit` (no message needed — it reuses the prepared merge message, which records both parents).
7. `git push`.

## Requirements

- The final commit must be a real merge commit with two parents — never squash, rebase, or otherwise flatten the source branch's history into a regular commit.
- Always validate after resolving conflicts and before committing. Committing is the last step, not a checkpoint to fix forward from.
- If the working tree isn't clean when this skill starts, stop and ask before touching it.
- When resolving conflicts, form a view of each side's intent before choosing a resolution — don't default to "keep both" without checking whether one side is meant to supersede the other.
- If validation can't fully pass (e.g. flaky or unavailable test infra), tell the user what you validated and what you couldn't, rather than committing silently.
