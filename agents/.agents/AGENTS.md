# Global Instructions

Applies across projects. More local instructions may override anything here.

## Plannotator

The user prefers using the plannotator inbox for all agent-user interactions. When the user mentions their "inbox", they're referring to the plannotator inbox.

- You MUST always respond in the user's plannotator inbox, unless explicitly told not to by the user. The user is running Claude in the background and will not see your messages in this chat unless you also send them to the plannotator inbox.
- You MUST always respond in a short and concise way. Use the `short-and-concise` skill.
- You SHOULD always send an acknowledgment message in the plannotator inbox before starting a long-running task. The user can't see what you are doing so they need to know you are working on it.
- You SHOULD consider generating artifacts in your plannotator response in the following situations.
  - **The information is large or spatial.** A long investigation may need a timeline, dependency map, annotated source, or filterable table. Breaking that material into conversational messages makes relationships harder to see.
  - **Visuals are needed.** A diagram, graph, or other visual may be more effective than a long textual description.
- You SHOULD keep artifacts clean so as to not overwhelm the user with too much content to read.
  - Keep content nicely organized with sections, headings, subheadings, and bullet points.
  - On each iteration, collapse / hide content that is no longer needed by the user. Rely on the user's messages as clues that the user no longer needs some content. Does the user appear to have read and understood your answer to a question? Has the user provided a final answer/decision to a question? Etc. If so, hide the content in a collapsible section and summarize the content or outcome.
  - Favor hiding / collapsing content over removing it. That way you can freely make a mistake in hiding content, and the user can still see it and ask you to unhide it if they want.
- You SHOULD favor using HTML artifacts over Markdown. The user prefers rich, interactive and color coded artifacts over plain text.

## Beads

The user wants all work performed by agents to be planned and tracked in beads (assuming it is setup in the repository in question), the issue tracking tool.
Use it as the user's personal and local only issue tracker. Do not use it as a replacement for Jira or Openspec,
but do use it to complement them. See the `beads` skill for full guidance.

## PR Conflicts

When dealing with merge conflicts in pull requests, NEVER assume the base branch of the PR. Always check the PR's base
branch and merge that branch in. Never assume it's the default branch of the repository.

## Subagents

_Only applicable if you have access to subagents._

Use subagents to create real concurrency or to isolate work. Prefer splitting work into independent tracks over a single sequential track.

The main agent remains an active builder. It owns scoping, a substantive main track when one exists, synthesis, dependency decisions, and final verification.

- Every track must complete without another parallel track's results, conflicting writes, or uncontrolled shared mutable state. Do not split work solely to reach a count.
- Give each subagent a bounded scope, the relevant context, its authority and write limits, and a concrete return artifact such as a specific answer, evidence list, or summary. Avoid open prompts such as "report findings" or "explore the codebase."
- Do not delegate formatting, transformation, or generation of data already in main-agent context merely to avoid doing the work.
- Treat a subagent's result as a claim: revalidate it against current state and never assume success. Late, stale, failed, or abandoned work is explicit residual, not a silent gap; stop a subagent whose work has become obsolete or cannot finish safely.

<!-- CODEGRAPH_START -->

## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->

<!-- plannotator-inbox:start v9 · added by Plannotator. Remove it in the Inbox's Settings or with `plannotator uninstall` -->

## Plannotator Inbox

The person keeps a Plannotator Inbox on this computer: a window where they read what agents send and answer when they can.
If you have a `plannotator_inbox` tool or a `plannotator-inbox` MCP server, use its `send_message` to ask a decision only they can make (as a `:::question` block) or to hand over finished long work (a short summary with its pictures in place, `![alt](path)` in the body, and the files to read in `attachments`). Then keep working.
A decision inside a report or summary still goes in a `:::question` block, one block per decision.
When you mention an issue or PR outside the repo you started in, write owner/repo#123 or its full URL every time; a bare #123 links to your own repo.
Their reply comes back to this session by itself where your agent supports that; otherwise read the thread later with `read_thread`.
Be proactive about Inbox updates and about replying to the person through the Inbox when you think they would want you to. Don't withhold important updates or decisions, and don't batch updates to send later: proactivity is better than procrastination.
One thread per work stream, unless the person says otherwise.
A decision you sent to the Inbox stays there. When the person writes in this chat, say what is waiting there (a short summary and the thread's link), but never also ask it in the chat with a blocking question tool (AskUserQuestion or similar): that blocks the chat and splits the answer. Ask in the chat only about something new they raised here that needs no pictures or files, or when they ask for it.
Before reply_to into a thread you have not read in this context window, call read_thread with no id and match the subject.
In a `:::question` block, keep the choices in their natural order and never move your recommendation first; put it on its own line after the choices as `Recommended: <label>`, and never write "(recommended)" in a choice label.
<!-- plannotator-inbox:end -->
