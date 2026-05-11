---
name: beads
description: Managing tasks (beads) — create, start, complete, and track work
---

# Beads

Beads are tasks tracked with the `bd` CLI. Run `bd prime` for full workflow context.

## Creating Beads

When asked to file beads based on a planning session or described work:

- Do NOT start any work. Only create beads.
- Choose one of two structures:
  - **Single bead** — self-contained work completable in one sitting, one logical commit.
  - **Epic + children** — multiple independent units. Create the epic first (`--type=epic`), then each child (`--parent=<epic-id>`).
  - When in doubt, break the work up.
- Wire up ordering with `bd dep add <blocked> <blocker>` when children must be completed in sequence.

Each bead must be fully self-contained — assume the agent picking it up has zero context:

```
bd create \
  --title "short, action-oriented summary" \
  --description "why, current state, what done looks like, all context and constraints" \
  --acceptance "concrete, verifiable criteria" \
  --notes "supplementary context" \
  --design "design decisions and trade-offs" \
  --type bug|feature|task|epic|chore|decision \
  --priority 0|1|2|3|4   # 0=critical, 1=high, 2=medium, 3=low, 4=backlog
```

Use `--validate` to check that required sections are present before filing.

When done, list created bead ids and titles for review.

## Starting a Bead

When asked to start work on a bead:

1. **Resolve the id** — if no id is given:
   - Check current branch: `git branch --show-current`
   - Run `bd show <branch>` — if a bead matches, confirm with the user.
   - If no match or user declines, run `bd ready` and ask them to choose.
2. **Review before touching code**: `bd show <id>` — check description, acceptance criteria, dependencies.
3. **Surface blockers** — if the bead is blocked, stop and inform the user.
4. **Claim atomically**: `bd update <id> --claim`
5. **If epic**: `bd show <id> --children`, then work through children in dependency order.

## During Work

Append notes for significant decisions (trade-offs, alternatives rejected, context for future readers):

```
bd update <id> --append-notes "..."
```

## Completing a Bead

1. Run relevant tests, lint, and build steps.
2. Commit with conventional commits using the bead id as scope, choosing the type that best matches the nature of the change:
   ```
   git commit -m "type(bd-xxx): description"
   ```
   For epic children, use the child's own id as scope — one commit per child.
3. Add a closing note: `bd update <id> --append-notes "Completed: ..."`
4. Close and surface next work: `bd close <id> --suggest-next`
   - Multiple beads can be closed at once: `bd close <id1> <id2> ...`

For epics: complete steps 1–4 for each child before closing the parent.
