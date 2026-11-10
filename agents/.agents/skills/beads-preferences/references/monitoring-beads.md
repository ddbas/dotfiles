# Monitor Beads

Use this when the **user** wants to follow a bead epic's progress (e.g. "I want to monitor that bead",
"I want to watch that bead", "show me the bead's progress") and has asked you to set up that monitoring
for them. You only set up the watch; the user does the watching.

## Workflow

1. Identify the epic id the user means.
2. Run the bundled script from the directory containing the beads database:

   ```bash
   <skill-dir>/scripts/monitor-epic.sh <epic-id>
   ```

3. Tell the user the window name the script printed (`watch-<epic-id>`) so they can switch to it when they want.

## What the script does

It validates the epic id, then opens a new detached tmux window named `watch-<epic-id>` in your current tmux
session. The window runs only `bd list --parent <epic-id> --all --watch`. It never switches the user's tmux
client to that window.

If the window already exists, it creates nothing and says so. Report that to the user.

## Rules

- You MUST use the script. Do not run the tmux or `bd` commands yourself; the script handles validation,
  session targeting, and duplicates.
- You MUST NOT attach to or switch to the watch window.
- If the script exits non-zero (not in tmux, unknown bead), relay its error message to the user.
