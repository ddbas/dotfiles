---
name: git-worktree
description: Managing git worktrees — add, list, remove, config
---

# Worktree Management

A worktree is a linked checkout of the current repository, used to work on
multiple branches simultaneously without stashing or switching.

## CLI

Always use the `worktree` CLI — never call `git worktree` directly. The CLI
enforces path conventions and handles file copying from git config.

## Convention

Worktrees are placed at `$REPO_DIR/worktree-<repo>-<branch>`. You don't need
to compute or enforce this path yourself — the `worktree` CLI handles it
automatically. It is described here only for reference when communicating
paths to the user.

## Configuration

Configuration is stored under the `personal.worktree.*` namespace in the
repo's local git config. It is visible from all worktrees of the same repo.
Values support multiple entries for the same key via `--add`.

```
worktree config --list                               # list all personal.worktree.* keys
worktree config --add personal.worktree.copy .env    # add a file to the copy list
worktree config --unset personal.worktree.copy .env  # remove a specific value
```

The `personal.worktree.copy` key lists files that are automatically copied
from the main worktree into each new worktree at creation time (e.g. `.env`,
secrets). Multiple files are registered with repeated `--add` calls.

## Adding

```
worktree add <branch>          # Check out existing branch in a new worktree
worktree add -b <branch>       # Create new branch and check it out
```

If the user wants to start work on a new feature or change, ask whether they
want a worktree. If yes, propose a branch name derived from the task, confirm
with the user, then run `worktree add -b <branch>`.

## Current

```
worktree current               # Print branch name of the current worktree
```

Use this when the user asks which worktree or branch they are currently in.

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
