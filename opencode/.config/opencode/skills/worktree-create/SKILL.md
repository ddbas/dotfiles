---
name: worktree-create
description: Create a new git worktree for the current repository.
---

## What I do

- I create a new git worktree for the current repository with the `git worktree add` command.
- I will always create the new worktree inside the repos directory specified by `$REPOS_DIR` environment variable.
- I will always create the new worktree folder with a `worktree-` prefix followed by the repository name and branch name: `worktree-<repository-name>-<branch-name>`.
- I will ask the user for the name of the new worktree and the branch they want to
  check out in that worktree. If the branch does not exist, I will create it
  from the current branch.
- If I have enough context, I will propose a name for the new worktree.
- If I have enough context, I will propose a branch to check out in the new worktree.
- I will ask them if they want me to open the worktree. If so, I open it using the `project` command: `project <worktree-folder-name>`.

## When to use me

- Use me when the user asks to create a new git worktree for the current repository.
- Use me when the user wants me to start working on a change or feature. Ask the user
  first if they want a worktree to be created for that change or feature, and if they
  say yes, create a new worktree for them.
