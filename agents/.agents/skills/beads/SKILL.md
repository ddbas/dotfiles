---
name: beads
description: Managing tasks (also called beads) — create, start, track, and complete work
---

# Beads

Beads are tasks tracked with the `bd` CLI. Run `bd prime` for full workflow context.
Use `--help` flag on any command for details on usage and options.

## Creating & updating

When asked to create a task or bead.

```sh
bd create "title"                         # Create a bead with a title
bd create "title" -t bug                  # Create a bead of type bug. Types: bug|feature|task|epic|chore
bd create "title" -p 0                    # Create a bead with priority 0. 0=highest, 4=lowest, 2=default
bd create "title" -d "description"        # Create a bead with a description. Use --stdin to read from stdin instead of the flag.
bd create "title" --parent=<epic-id>      # Create a bead as a child of an epic
bd create "title" --acceptance="criteria" # Create a bead with acceptance criteria
bd update <id> ...                        # Update an existing bead with the same options as create, plus `--title`.
```

Use `bd dep add <issue-id> <depends-on-id>` to add a dependency between two beads.

## Finding work

```sh
bd ready     # Show issues ready to work (no blockers)
bd list      # List all open beads
bd show <id> # Show details of a bead
```

## Starting a bead

When asked to start work on a bead or task, follow these steps:

1. **Resolve the id** — if no id is given, infer from context or run `bd ready` and ask the user to choose.
2. **Review before touching code**: `bd show <id>` — check description, acceptance criteria, dependencies.
3. **Surface blockers** — if the bead is blocked, stop and inform the user.
4. **Claim atomically**: `bd update <id> --claim`
5. **If epic**: `bd show <id> --children`, then work through children in dependency order.

**IMPORTANT**: Always keep the bead's status updated to reflect the current state of work.

## During Work

Append notes for significant decisions (trade-offs, alternatives rejected, solutions
for issues encountered, context for future readers):

```sh
bd update <id> --append-notes "..."
```

## Completing a Bead

Always follow these steps when completing a bead:

1. `bd show <id>` - review the acceptance criteria with and ensure all are met.
   If not, iterate until they are.
2. `bd update <id> --append-notes "Completed: ..."` - add closing note summarizing
   work and relevant context for future readers.
3. `bd close <id>` - mark the bead as complete.
4. `git commit -m "type(bd-xxx): description"` - commit with a message referencing
   the bead id. Use conventional commits format.
5. **IMPORTANT** - For parent beads (e.g. epics), complete these steps separately
   for each child bead, referencing the child's id in the commit message. Close
   the parent only after all children are complete.
