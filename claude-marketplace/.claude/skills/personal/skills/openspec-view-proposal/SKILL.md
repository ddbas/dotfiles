---
name: openspec-view-proposal
description: Viewing or opening the current openspec proposal on GitHub in the browser
---

# OpenSpec View Proposal

## Instructions

1. Parse the git remote URL (`git remote get-url origin`) to extract the GitHub hostname, org name, and repo name. Handle both SSH (`git@<host>:<org>/<repo>.git`) and HTTPS (`https://<host>/<org>/<repo>.git`) formats. Default the hostname to `github.com` if it cannot be determined.
2. Get the current branch name (`git branch --show-current`).
3. Identify the proposal name from the directory currently being worked on under `openspec/changes/`. Use, in order: (a) recently changed or added files on the branch (`git status`), (b) files touched in commits on the current branch relative to the base branch (`git log <base>..<branch> --name-only`).
4. Construct and share the URL: `https://<github-hostname>/<org-name>/<repo-name>/blob/<branch-name>/openspec/changes/<proposal-name>/`

## Requirements

- URL format must be exactly: `https://<github-hostname>/<org-name>/<repo-name>/blob/<branch-name>/openspec/changes/<proposal-name>/`
- All openspec changes on the current branch must be committed and pushed before sharing the URL, otherwise the proposal will not be visible on GitHub.
- Unless the user has explicitly asked to share this URL, ask first before committing and pushing — they may not be ready to do so yet.
