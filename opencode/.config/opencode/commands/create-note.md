---
description: Persist information from this conversation as a zettel note in the notes repository.
---

The user's optional clarification is: '$1'

Review the conversation and identify what content to persist as a note:
- If the conversation produced specific generated content (e.g. a summary, explanation, list, or analysis that the assistant wrote), use that content verbatim as the note body.
- If the conversation was a discussion or back-and-forth, synthesize the key information into a well-formed note.
- If '$1' was provided, use it to narrow or focus what gets captured.

Then:
1. Decide on a concise, descriptive title for the note.
2. Compose the full note body as a string, then pipe it to the script:
   ```
   cat <<'EOF' | note-create-zettel "<title>"
   <body>
   EOF
   ```
3. Report the created filename to the user.
