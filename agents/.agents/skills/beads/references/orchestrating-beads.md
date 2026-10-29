# Orchestrate Beads

When you are given a bead to orchestrate, you must always follow these rules and best practices.

Orchestrating involves organizing and delegating work the work defined in a given parent bead
(usually an `epic`) to subagents. Your responsibility is to ensure the work gets done.

## Workflow

1. **Check**: Check that the bead is ready to be orchestrated (i.e. it is not blocked)
2. **Plan**: Plan the execution order of the bead's child beads. Determine which beads can be worked on in parallel and which must be done sequentially.
3. **Delegate**: Assign the child beads to subagents for execution.
4. **Monitor**: Monitor the progress of the child beads and ensure they are completed successfully.
5. **Resolve**: If all child beads are completed successfully, close the parent bead.

## Rules

**CRITICAL RULE**: You MUST always delegate all work to subagents. Never do the work yourself. You are responsible for orchestrating the work, not implementing it.

- You MUST create temporary bonsai worktrees for each subagent to work in when you are delegating beads to more than 1 subagent at a time. You MUST merge the worktrees back into your worktree when the subagents have completed their work.
- You SHOULD not assign a whole parent (or epic) bead to a subagent.
- You SHOULD only assign 1 bead per subagent.
- You MAY delegate multiple beads to parallel subagents if the beads are independent and can be worked on in parallel.
