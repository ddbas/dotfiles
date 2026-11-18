---
name: end-session
description: Ends and closes the current agent session by closing its tmux window. Use when the user explicitly names the agent and asks to end, close, or exit its session, chat, or conversation, e.g. "end this claude session" or "close this pi chat". Do not use when the agent is not named (e.g. "end this session"), since that may refer to something other than the agent.
---

# End Session

Ends the current agent (e.g. claude, pi, etc.) session and closes the underlying tmux window.
By default it does not close the tmux session itself. If this agent's window is the last one in the
session, a replacement window is created first so the tmux session survives.

Optionally, it can close the agent's entire tmux session instead (see below).

## Workflow

Run the `./scripts/end-session.sh` script that is in this skill's directory.

To also kill the agent's entire tmux session, run `./scripts/end-session.sh --kill-tmux-session`. Only do
this when the user explicitly asks to kill/close the tmux session (not just the agent's session, chat,
or conversation). It closes every window in that session, including other agents running there, so
mention that in your reply if other windows exist. The script targets the session of the agent's own
pane, never the session the user is currently viewing.

## Rules

- You MUST run the skill within the agent's own tmux window.
- You MUST NOT pass `--kill-tmux-session` unless the user explicitly asked to kill the tmux session. When in doubt, close only the window.
- You MUST never run this skill if the user hasn't explicitly named the agent in their request (e.g. claude, pi, etc.). Phrases like "end this session", "close this chat", "exit this conversation" are ambiguous and may refer to something other than the agent.
