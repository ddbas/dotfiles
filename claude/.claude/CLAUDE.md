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
- You SHOULD keep a lavish artifact clean so as to not overwhelm the user with content. Keep content nicely organized with sections. If content is no longer needed or relevant (e.g. the user has made a decision), hide it from the user in a collapsible section and summarize the outcome in the main content. If the user wants to see the hidden content, they can expand it.
- You SHOULD respond to user requests and queries by editing the artifact (the HTML file), not with --agent-reply. Put your answer to each prompt in the artifact itself. Keep any agent reply to a one-line acknowledgment. The user can see the artifact and your response in the artifact itself. If you need to ask the user a question, put it in the artifact itself, not in the agent reply message. The user prefers to look at the artifact than the conversation panel.

<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:6cd5cc61 -->

## Beads Issue Tracker

This project uses **bd (beads)** for issue tracking. Run `bd prime` to see full workflow context and commands.

### Quick Reference

```bash
bd ready              # Find available work
bd show <id>          # View issue details
bd update <id> --claim  # Claim work
bd close <id>         # Complete work
```

### Rules

- Use `bd` for ALL task tracking — do NOT use TodoWrite, TaskCreate, or markdown TODO lists
- Run `bd prime` for detailed command reference and session close protocol
- Use `bd remember` for persistent knowledge — do NOT use MEMORY.md files

**Architecture in one line:** issues live in a local Dolt DB; sync uses `refs/dolt/data` on your git remote; `.beads/issues.jsonl` is a passive export. See https://github.com/gastownhall/beads/blob/main/docs/SYNC_CONCEPTS.md for details and anti-patterns.

## Agent Context Profiles

The managed Beads block is task-tracking guidance, not permission to override repository, user, or orchestrator instructions.

- **Conservative (default)**: Use `bd` for task tracking. Do not run git commits, git pushes, or Dolt remote sync unless explicitly asked. At handoff, report changed files, validation, and suggested next commands.
- **Minimal**: Keep tool instruction files as pointers to `bd prime`; use the same conservative git policy unless active instructions say otherwise.
- **Team-maintainer**: Only when the repository explicitly opts in, agents may close beads, run quality gates, commit, and push as part of session close. A current "do not commit" or "do not push" instruction still wins.

## Session Completion

This protocol applies when ending a Beads implementation workflow. It is subordinate to explicit user, repository, and orchestrator instructions.

1. **File issues for remaining work** - Create beads for anything that needs follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Update issue status** - Close finished work, update in-progress items
4. **Handle git/sync by active profile**:
   ```bash
   # Conservative/minimal/default: report status and proposed commands; wait for approval.
   git status

   # Team-maintainer opt-in only, unless current instructions forbid it:
   git pull --rebase
   git push
   git status
   ```
5. **Hand off** - Summarize changes, validation, issue status, and any blocked sync/commit/push step

**Critical rules:**

- Explicit user or orchestrator instructions override this Beads block.
- Do not commit or push without clear authority from the active profile or the current user request.
- If a required sync or push is blocked, stop and report the exact command and error.

<!-- END BEADS INTEGRATION -->
