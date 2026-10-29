# Creating Beads

When planning work (large or small) for yourself or for other agents, you must always create
beads to track the work.

Use `bd create` to create a bead. Use `bd update` to update it.

## Rules

**CRITICAL RULE**: You MUST always author beads as if the the agent executing the work has no context at all about the work. The bead must contain all the information needed for the agent to understand and complete the work.

Other rules:

- You MUST create beads for all work, even if it is a small task.
- You MUST create a parent bead of type "epic" for large bodies of work, then use the `--parent` flag to create child beads in that epic.
- You MUST include a description in a bead (using `--description` flag).
- You MUST mark blocking dependencies between beads. You SHOULD always mark other relationships between beads for additional context information. You can use the `--deps` flag for both, or the `bd dep` command.
- You SHOULD indicate the priority of a bead (using `-p` flag).
- You SHOULD include acceptance criteria in a bead (using `--acceptance` flag).
- You SHOULD include context in a bead (using `--context` flag).
