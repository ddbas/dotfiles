---
name: notes
description: Managing notes — create, list, show, update, remove
---

# Notes

Notes are stored as markdown files in `$NOTES_DIR/notes/`. Always use the `note` CLI — never write files directly. Run `note --help` or `note <command> --help` for full option details.

## Note Types

**Zettel** — atomic, evergreen notes. Filename: 14-digit timestamp (e.g. `20240511143022.md`).

**Daily** — one note per day. Filename: `YYYY-MM-DD.md` (e.g. `2024-05-11.md`). The path is always derivable from the date — no need to list files to find it.

## Listing

```
note list
note zettel list
note daily list
```

## Showing

```
note show <id>
note zettel show <id>
note daily show [date]          # date defaults to today
```

## Creating

```
note zettel create [title]      # alias: note create-zettel; reads body from stdin
note daily create [date]        # alias: note create-daily; date defaults to today
```

When the user asks to save or capture information as a zettel:

1. Ask if they want a title.
2. Compose the note body.
3. Pipe the body: `note zettel create [title]`
4. Report the created filename.

## Updating

```
note zettel update <id>
note daily update [date]        # date defaults to today
```

## Removing

```
note zettel remove -f <id>
note daily remove -f [date]     # date defaults to today; -f required
```
