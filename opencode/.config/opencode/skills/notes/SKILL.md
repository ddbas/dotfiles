---
name: notes
description: Managing notes — create, list
---

# Notes

Notes are stored as markdown files in the notes repository.

## Note Types

**Zettel** — atomic, evergreen notes identified by a timestamp filename (e.g. `20240511143022.md`). Used for notes that span several days of work, such as research or feature development.

**Daily note** — represents a full day. Meeting notes, quick thoughts, and other time-bound content go into the daily note for the day they were written, identified by a date filename (e.g. `2024-05-11.md`).

## CLI

Always use the `note` CLI — never write note files directly or call internal scripts.
The CLI enforces all note conventions automatically.

The `note` CLI requires the `NOTES_DIR` environment variable to be set.

Use the `--help` flag on any subcommand to get detailed usage information.

## Listing Notes

```
note list [-t type] [-T tag] [--sort date|name]
```

Lists notes from the notes directory. Options:

- `-t type` — filter by type: `zettel` or `daily`
- `-T tag` — filter by tag (searches for `#tag` in file content)
- `--sort date` — sort by modification date, newest first (default)
- `--sort name` — sort by filename, ascending

## Showing a Note

```
note show <id>
```

Prints the full contents of a note. `<id>` is the note filename, with or without the `.md` extension.

## Listing Zettel Notes

```
note zettel list [-T tag] [--sort date|name]
```

Lists only zettel notes. Equivalent to `note list -t zettel`. Options:

- `-T tag` — filter by tag (searches for `#tag` in file content)
- `--sort date` — sort by modification date, newest first (default)
- `--sort name` — sort by filename, ascending

## Showing a Zettel

```
note zettel show <id>
```

Prints the full contents of a zettel note. `<id>` must be a zettel (14-digit timestamp filename). Returns an error if the id is not a zettel.

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

## Updating a Zettel

```
note zettel update [--append] [--title <title>] [-t tag] <id>
```

Updates an existing zettel note. `<id>` must be a zettel (14-digit timestamp filename).

Options:
- `--append` — append content from stdin to the end of the note body
- `--title <title>` — update the frontmatter alias and H1 heading
- `-t tag` — add a tag to the note (can be repeated)

When the user asks to update, append, or add tags to an existing zettel:

1. Determine the zettel id from context or ask the user.
2. Use the appropriate flags for the requested update.
3. If appending content, pipe it via stdin with `--append`.
4. Report the updated filename to the user.

## Removing a Zettel

```
note zettel remove -f <id>
```

Deletes a zettel note. `<id>` must be a zettel (14-digit timestamp filename). The `-f/--force` flag is required to confirm deletion (the CLI is non-interactive and will error without it).
