---
name: openspec-show-proposal
description: Showing the current openspec proposal on GitHub in the browser
---

# OpenSpec View Proposal

## Instructions

1. Identify the proposal id (the directory name under `openspec/changes/`) for the change currently being worked on. Use, in order: (a) recently changed or added files on the branch (`git status`), (b) files touched in commits on the current branch relative to the base branch (`git log <base>..<branch> --name-only`).
2. Run `openspec-proposal-url <proposal-id>` to get the URL.
3. Share the URL with the user.

## Requirements

- All openspec changes on the current branch must be committed and pushed before sharing the URL, otherwise the proposal will not be visible on GitHub.
- Unless the user has explicitly asked to share this URL, ask first before committing and pushing — they may not be ready to do so yet.
