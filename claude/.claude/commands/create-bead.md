---
description: File beads for the work discussed in this planning session.
agent: build
---

## Your Task

The user has provided the following input: '$ARGUMENTS'.

- If input was provided, use it as the primary basis for the bead(s), supplemented by any relevant conversation context.
- If no input was provided, derive the work entirely from the planning context in this conversation.

Do NOT start any work. Your only output is the created beads.

## Deciding on Structure

Choose one of two structures:

**Single bead** — if the work is self-contained, can be completed in one sitting, and results in one logical commit.

**Epic + children** — if the work spans multiple independent units that could be worked on or reviewed separately. Create the epic first with `--type=epic`, then create each child with `--parent=<epic-id>`.

When in doubt, break the work up.

## Writing Good Beads

Each bead must be fully self-contained. Assume the agent that picks it up is completely fresh with zero context from this conversation. Include in each bead:

- `--title` — short, action-oriented summary
- `--description` — why this work is needed, what the current state is, and what "done" looks like. Include all relevant context, decisions, and constraints discussed during planning. Do not assume the reader has any prior knowledge.
- `--acceptance` — concrete, verifiable criteria for completion
- `--type` — `feat`, `fix`, `chore`, `refactor`, `docs`, or `test` (or `epic` for the parent)
- `--priority` — use your best judgment: 0 (critical), 1 (high), 2 (medium), 3 (low), 4 (backlog)

## Dependencies

If child beads must be completed in a specific order, wire up dependencies with `bd dep add <blocked> <blocker>`.

## Output

When done, list the created bead ids and titles for my review.
