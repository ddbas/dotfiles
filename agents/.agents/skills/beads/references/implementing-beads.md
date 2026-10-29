# Implementing Beads

When you are given a bead to implement, you must always follow these rules and best practices.

Use `bd update --claim` to start a bead. Use `bd update` to update it. Use `bd comment` to report progress, decisions, and notable events. Use `bd close` to close it.

## Workflow

1. **Check**: Check that the bead is ready to be worked on (i.e. it is not blocked)
2. **Claim**: Claim the bead before doing any work: `bd update --claim <bead-id>`.
3. **Understand**: Read the bead description, acceptance criteria, context, and any other information the bead provides (`bd show <bead-id>`).
4. **Work**: Implement the bead work. Continuously report progress, decisions, and notable events in the bead with a comment (`bd comment`).
5. **Resolve**: If you complete the bead, close it (`bd close <bead-id>`). If you are blocked and cannot complete the bead, defer it (`bd defer <bead-id>`).

## Rules

**CRITICAL RULE**: You MUST always keep the bead updated with its latest status and progress.

- You MUST always claim the bead before doing any work, or even reviewing the bead.
- You MUST always close the bead when you complete the work. You work is not complete until the bead is closed.
- You MUST always defer a bead if you are blocked and unable to complete it (using `bd defer`).
- You SHOULD begin every notable step of your work by updating the bead with a comment (using `bd comment`) to give granular visibility into progress.
- You SHOULD report decisions, notable events, and blockers in the bead with a comment (using `bd comment`) to give visibility into your work.
- You SHOULD provide a reason when deferring or closing a bead (using `--reason` flag) to explain the context behind the status change.
