---
name: delete-git-worktree
description: Deletes an existing git worktree for the current repository.
---

## What I do

- I delete a git worktree for the current repository using the `git worktree remove` command.
- If I'm unsure which worktree to delete, I will list the existing worktrees for the current
  repository and ask the user which one they want to delete.

## When to use me

- Use me when the user asks me to delete a git worktree. I will confirm with the user
  before deleting the worktree to ensure they don't accidentally delete something important.
- Use me when I notice that work has been completed in a worktree and it can probably be deleted
  to free up space and reduce clutter.
