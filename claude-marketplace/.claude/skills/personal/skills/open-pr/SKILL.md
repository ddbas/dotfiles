---
name: open-pr
description: Opening a pull request for the current branch in the browser
---

# Open Pull Request

> **CRITICAL: You MUST NOT create the pull request yourself.** Your only job is
> to prepare the title and body, then open the GitHub PR form in the browser
> with `gh pr create --web` so the user can review and submit it themselves.
> Omitting `--web` and letting `gh` create the PR directly is **never**
> acceptable.

## Steps

1. Determine the current branch:
   ```
   git branch --show-current
   ```

2. Determine the base branch:
   - If the user specified a base branch, use it.
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

5. Locate the PR body template — this is MANDATORY if a template exists.
   Search in this order:
   - `.github/pull_request_template.md`
   - `.github/PULL_REQUEST_TEMPLATE.md`
   - `docs/pull_request_template.md`
   - `.github/PULL_REQUEST_TEMPLATE/` (directory — use the first `.md` file found)

   If a template is found, you MUST use it as the body structure. Fill every
   section using the commits on this branch and the conversation history.
   Leave sections you cannot confidently answer blank rather than guessing or
   omitting them. Do NOT replace the template with a free-form summary.

   If no template is found (after checking all locations above), write a
   brief body summarising what the PR does and why.

6. Open the PR form in the browser — **do not omit `--web`**:
   ```
   gh pr create --web --base <base-branch> --title "<title>" --body "<body>"
   ```
   This opens the GitHub PR form pre-filled with the title and body.
   Your work is done once the browser opens. The user will review and submit.

## Important

- **NEVER run `gh pr create` without `--web`.** That would create the PR
  immediately without the user's review. Always use `--web`.
- The `--title` and `--body` flags pre-populate the form; the user can still
  edit everything before submitting.
- If a PR body template exists in the repo, you MUST use it. Never substitute
  it with a free-form summary.
- Never include internal issue-tracker references (e.g. beads IDs) in the PR
  title or body. These are private tracking details not meant for the shared
  pull request history.
