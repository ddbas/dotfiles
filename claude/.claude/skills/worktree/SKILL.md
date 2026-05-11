---
name: worktree
description: Managing git worktrees — init, create, list, remove
---

# Worktree Management

A worktree is a linked checkout of the current repository, used to work on
multiple branches simultaneously without stashing or switching.

## CLI

Always use the `worktree` CLI — never call `git worktree` directly. The CLI
enforces path conventions and handles file copying from `.worktree.config.json`.

## Convention

Worktrees are placed at `$REPO_DIR/worktree-<repo>-<branch>`. You don't need
to compute or enforce this path yourself — the `worktree` CLI handles it
automatically. It is described here only for reference when communicating
paths to the user.

## Initializing

```
worktree init [-f <file>]...   # Create .worktree.config.json in the repo root
```

This is a one-time setup step for repos that haven't used the `worktree` CLI
before. Run it once at the repo root to create `.worktree.config.json`. Use
`-f <file>` to register files (e.g. `.env`, secrets) that should be copied into
every new worktree automatically.

## Creating

```
worktree create <branch>       # Check out existing branch in a new worktree
worktree create -b <branch>    # Create new branch and check it out
```

If the user wants to start work on a new feature or change, ask whether they
want a worktree. If yes, propose a branch name derived from the task, confirm
with the user, then run `worktree create -b <branch>`.

## Listing

```
worktree list                  # List branches of all managed worktrees
```

Use this to discover existing worktrees when the user asks to switch to or
remove one and hasn't specified a branch.

## Removing

```
worktree remove <branch>          # Remove worktree for branch
worktree remove --force <branch>  # Force-remove even with uncommitted changes
```

Always confirm with the user before removing. Check `worktree list` first if
unsure which worktree they mean. Proactively suggest removal when work in a
worktree is clearly complete (PR merged, branch deleted, etc.).
