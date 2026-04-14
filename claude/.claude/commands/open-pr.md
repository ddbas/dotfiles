---
description: Open a pull request for the current branch in the browser.
agent: build
---

## Your Task

Open a pull request for the current branch in the browser using `gh pr create --web`.

The optional base branch is: '$ARGUMENTS'.

## Steps

1. Determine the current branch:
   ```
   git branch --show-current
   ```

2. Determine the base branch:
   - If '$ARGUMENTS' was provided, use it as the base.
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

4. Craft a PR title:
   - Review the commits on this branch that are not on the base branch:
     ```
     git log <base-branch>..HEAD --oneline
     ```
   - Derive a concise, imperative-mood title that accurately summarises the change (e.g. "Add dark mode toggle to settings page").

5. Check for a PR body template in the repo. Look in these locations in order:
   - `.github/pull_request_template.md`
   - `.github/PULL_REQUEST_TEMPLATE.md`
   - `docs/pull_request_template.md`
   - `.github/PULL_REQUEST_TEMPLATE/` (directory — use the first `.md` file found)

   If a template is found, fill it out using the context you have: the commits on this branch, any linked bead/issue, and the conversation history. Leave any sections you cannot confidently answer blank rather than guessing.

   If no template is found, write a brief body summarising what the PR does and why.

6. Run:
   ```
   gh pr create --web --base <base-branch> --title "<title>" --body "<body>"
   ```

## Important

- Do NOT create the PR yourself. `--web` opens the GitHub PR form in the browser pre-filled with the title and body — your job is done once the browser opens. The user will review and submit.
- The `--title` and `--body` flags pre-populate the form; the user can still edit everything before submitting.
