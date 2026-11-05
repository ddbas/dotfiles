# Global Instructions

Applies across projects. More local instructions may override anything here.

## Subagents

Use subagents to create real concurrency or to isolate work. Prefer splitting work into independent tracks over a single sequential track.

The main agent remains an active builder. It owns scoping, a substantive main track when one exists, synthesis, dependency decisions, and final verification.

- Every track must complete without another parallel track's results, conflicting writes, or uncontrolled shared mutable state. Do not split work solely to reach a count.
- Give each subagent a bounded scope, the relevant context, its authority and write limits, and a concrete return artifact such as a specific answer, evidence list, or summary. Avoid open prompts such as "report findings" or "explore the codebase."
- Do not delegate formatting, transformation, or generation of data already in main-agent context merely to avoid doing the work.
- Treat a subagent's result as a claim: revalidate it against current state and never assume success. Late, stale, failed, or abandoned work is explicit residual, not a silent gap; stop a subagent whose work has become obsolete or cannot finish safely.

## Beads

The user wants all work performed by agents to be planned and tracked in beads, the issue tracking tool.
Use it as the user's personal and local only issue tracker. Do not use it as a replacement for Jira or Openspec,
but do use it to complement them. See the `beads` skill for full guidance.

## PR Conflicts

When dealing with merge conflicts in pull requests, NEVER assume the base branch of the PR. Always check the PR's base
branch and merge that branch in. Never assume it's the default branch of the repository.

## Lavish

- You MUST always long-poll lavish artifacts. Never just create and open it. When the user uses lavish, it is not just because they want a rich HTML artifact, but also because they want to converse via lavish.
- You MUST always use the Bash tool with `run_in_background: true` to long-poll lavish artifacts. Set the `timeout` to the maximum allowed. If it times out, restart it for a maximum of 3 more times.
- You SHOULD use a light theme for lavish artifacts. The user prefers them.
- You SHOULD keep a lavish artifact clean so as to not overwhelm the user with content. Keep content nicely organized with sections. If content is no longer needed or relevant (e.g. the user has made a decision), hide it from the user in a collapsible section and summarize the outcome in the main content. If the user wants to see the hidden content, they can expand it.
- You SHOULD respond to user requests and queries by editing the artifact (the HTML file), not with --agent-reply. Put your answer to each prompt in the artifact itself. Keep any agent reply to a one-line acknowledgment. The user can see the artifact and your response in the artifact itself. If you need to ask the user a question, put it in the artifact itself, not in the agent reply message. The user prefers to look at the artifact than the conversation panel.
