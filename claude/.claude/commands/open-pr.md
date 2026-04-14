---
description: Open a pull request for the current branch in the browser.
agent: build
---

## Your Task

Open a pull request for the current branch in the browser using `gh pr create --web`.

The optional base branch is: '$1'.

## Steps

1. Determine the current branch:
   ```
   git branch --show-current
   ```

2. Determine the base branch:
   - If '$1' was provided, use it as the base.
   - Otherwise, detect the repo's default branch:
     ```
     gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'
     ```
   - If that command fails, fall back to `main`.

3. Check whether the current branch has been pushed to the remote:
   ```
   git status --short --branch
   ```
   - If there is no upstream tracking branch, ask the user: "Branch `<name>` has not been pushed to the remote. Push it now with `git push --set-upstream origin <name>`?"
   - Only push if the user confirms.

4. Run:
   ```
   gh pr create --web --base <base-branch>
   ```

## Important

- Do NOT create the PR yourself. `--web` opens the GitHub PR form in the browser — your job is done once the browser opens.
- Do NOT fill in a title or body on behalf of the user; the web UI handles that.
