---
name: notes
description: Managing notes — create
---

# Notes

Notes are stored as Zettelkasten-style markdown files in the notes repository.

## CLI

Always use the `note` CLI — never write note files directly or call internal scripts.
The CLI enforces all note conventions automatically.

The `note` CLI requires the `NOTES_DIR` environment variable to be set.

Use the `--help` flag on any subcommand to get detailed usage information.

## Creating a Zettel

```
note zettel create [title]
```

Reads the note body from stdin. Title is optional — ask the user whether they want one before creating the note.

When the user asks to save, persist, or capture information from the conversation:

1. Ask the user if they want a title for the note.
2. Compose the full note body.
3. Pipe the body to `note zettel create` (with title if provided).
4. Report the created filename to the user.

If the user provides a focus or clarification, use it to narrow what gets captured.
