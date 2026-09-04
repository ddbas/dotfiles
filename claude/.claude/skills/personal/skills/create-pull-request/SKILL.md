---
name: create-pull-request
description: Creating a pull request for the current branch
---

# Create Pull Request

## Process

1. Determine the base branch with `gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'`, defaulting to `main`.
2. For the pull request body, look for a pull request template at `pull_request_template.md`, `.github/pull_request_template.md`, or `.github/PULL_REQUEST_TEMPLATE/pull_request_template.md`. If found, copy it in a temp folder and fill every section it requires. If not, formulate your own brief summary of the changes.
3. Create the pull request in draft mode: `gh pr create --draft --base <base> --title "<title>" --body "<body>"`.
4. Share the pull request URL with the user.

## Requirements

1. Only one open pull request per branch — check with `gh pr list --head <branch> --state open` before creating.
2. Title in conventional commit format: `<type>[optional scope]: <description>`. Type must be one of `feat`, `fix`, `chore`, `docs`, `refactor`, `perf`, `test`, `ci`, or `build`. Examples: `docs: correct spelling of CHANGELOG`, `feat(lang): add Polish language`.
3. Fill the pull request template exactly as specified — do not add, modify, or remove anything the template doesn't ask for.
