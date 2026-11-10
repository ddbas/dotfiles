---
name: beads-preferences
description: Use this skill anytime you are using "beads" (the `bd` CLI) or are planning a large body of work. This skill provides the user's personal preferences for using "beads". It gives all the guidelines, rules, and best practices for using beads. It also gives instructions for specific workflows, including planning, orchestrating, and imlpementing beads work. Also use this skill when the user wants to monitor, watch, or follow the progress of a bead or epic (e.g. "I want to monitor that bead's progress", "show me the bead's progress").
---

# Beads

Use beads to ensure that every task or large body of work is planned, tracked, and executed in a way
that is visible to the user and other agents. This includes the tasks' descriptions, acceptance criteria,
context, status, progress, and history.

## Beads vs. Jira, Openspec

Beads should never be used as a replacement for Jira or Openspec. If a Jira ticket or openspec change is
involved in the work, use beads to reference and complement them, but do not use beads to replace them.
Beads is a tool that is personal to the user and is meant to be used to ensure every aspect of a task
is tracked and accessible by the user and the agents doing the work on the user's machine.

## References

| Scenario                     | Reference                           |
| ---------------------------- | ----------------------------------- |
| You need to plan work        | `references/creating-beads.md`      |
| You need to orchestrate work | `references/orchestrating-beads.md` |
| You need to implement work   | `references/implementing-beads.md`  |
| The user wants to monitor, watch, or follow a bead's progress (e.g. "I want to monitor that bead", "show me its progress") and you set up the watch for them | `references/monitoring-beads.md` |

## Rules

- You MUST never mention beads or bead ids in files versioned in git, or any other public/shared location (e.g. PR). Beads are a personal and local only issue tracker.
- You SHOULD always orchestrate beads of type "epic".
- You MAY mention beads in commit messages since non-default branches are ephemeral and owned by the user.
