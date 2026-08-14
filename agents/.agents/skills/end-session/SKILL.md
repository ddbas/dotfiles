---
name: end-session
description: Use when the user asks to end, close, or exit the current session, chat, or conversation. Ends the session by opening a new tmux window and closing the one the agent is running in.
---

# End Session

Run the bundled script to end the current session:

```bash
./end-session.sh
```

This must be run from inside a tmux session. It kills the window the agent is
running in. If that window is the only one left in the session, it first
opens a new window so the session itself is never closed.
