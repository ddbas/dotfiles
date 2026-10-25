---
name: create-pull-request
description: Creating a pull request. Use when the user asks to create a pull request.
---

# Create Pull Request

## Workflow

1. Run `scripts/pr-info.sh` (relative to this skill) to get the branch, base branch, PR template paths, and any existing open PRs.
2. If there is an existing open PR, stop and inform the user.
3. Prepare the PR body. Use the pull request template if available, otherwise create a brief summary of the changes. If there are multiple templates to choose from, ask the user which to use.
4. Create the PR: `gh pr create --base <base> --title "<title>" --body "<body>"`. Use `--draft` if the user asked for a draft pull request. Use `--base` if the user asked for a specific base branch.
5. Share the results in the following format:

```md
**URL:** <url>
**Title:** "<title>"
**Base:** <base-branch>
**Draft:** <true|false>
```

## Rules

1. A branch MUST only have one open PR at a time.
2. The title MUST be in the conventional commit format: `<type>[optional scope]: <description>`. Type must be one of `feat`, `fix`, `chore`, `docs`, `refactor`, `perf`, `test`, `ci`, or `build`. Examples: `docs: correct spelling of CHANGELOG`, `feat(lang): add Polish language`.
3. You MUST fill the PR template exactly as specified.
