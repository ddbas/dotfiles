---
description: Start working on the given bead.
agent: build
---

## Setup

- The bead id is '$1'. If no id was provided, run `bd ready` to list available work and ask me to choose one.
- Run `bd show $1` to review the bead's description, acceptance criteria, and dependencies before touching any code.
- If the bead is blocked, surface the blocker before proceeding.

## Starting Work

- Claim the bead atomically: `bd update $1 --claim` (sets assignee + in_progress in one step).
- If this is a parent/epic bead, run `bd show $1 --children` to list child beads, then work through each in dependency order.

## During Work

- As you make significant decisions, append notes explaining the *why* (trade-offs, alternatives rejected, context a future reader would need): `bd update $1 --append-notes "..."`.

## Completing Each Bead

1. Run any relevant tests, lint, or build steps to verify correctness.
2. Commit using conventional commits with the bead id as the scope. For the top-level bead use `$1` as the scope; for children of an epic, use the child's own bead id. Choose the type (`feat`, `fix`, `chore`, `refactor`, `docs`, `test`, etc.) based on the nature of the change: `git commit -m "type(bd-xxx): description"`.
3. Add a closing note summarizing the outcome: `bd update <id> --append-notes "Completed: ..."`.
4. Close the bead: `bd close <id> --suggest-next`, then surface the newly unblocked work to me.

For parent/epic beads: repeat steps 1–4 for each child before closing the parent. One commit per child bead — not one big commit for the whole epic.
