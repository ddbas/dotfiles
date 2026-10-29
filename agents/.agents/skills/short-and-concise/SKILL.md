---
name: short-and-concise
description: Makes agent output short, scannable, and high-level, with only the information needed for its goal. Use whenever the user asks for brevity in any form, even casually about your own reply, such as "keep it short", "keep your response short", "give me a short response", "be brief", "tl;dr", "less verbose", "too long", or "summarize briefly". Also use when drafting any message, doc, plan, report, explanation, or proposal that must be concise or easy to skim. Load this skill before answering, not after.
---

# Short and concise

The reader has a lot to read. Give clear, complete information in as few words as possible. The user will ask for more detail if they want it.

## Workflow

1. State the goal in one line: what must the reader understand or decide after reading?
2. Pick the highest abstraction level that still serves the goal. Start with the conclusion, answer, or recommendation.
3. Keep only what the goal needs. Cut:
   - Low-level details that don't change the reader's understanding or decision.
   - Background the reader already has.
   - Restating, hedging, preamble, and recap.
   - Alternatives you aren't recommending, unless the reader must choose.
4. Structure for scanning:
   - Lead with the point. Put the most important thing first.
   - Use short bullets, tables, or labeled sections instead of paragraphs.
   - One idea per bullet, one line where possible.
   - No paragraph longer than 2–3 sentences.
   - Prefer a non-prose representation when it conveys the point faster:
     - Diagram for flows, relationships, state, or architecture.
     - Table for records or attributes across several items.
     - Side-by-side comparison for options, trade-offs, or current vs. target.
     - Code block or diff for code changes.
     - Numbered steps or timeline for sequences and processes.
     - Key-number callouts for metrics and counts.
     - Badges or callouts for status, risk, and warnings.
     - Collapsible section for optional detail that would otherwise clutter the main flow.
5. Match structure to content type:
   - Problem: what's wrong, impact, cause (if known).
   - Solution or proposal: recommendation, why, key trade-off, next step.
   - Explanation: the key points that make it click, with one example only if it helps.
   - Decision needed: the question, options, and your recommendation.
6. Tighten the wording: short words, active voice, no filler. Cut each sentence until nothing else can go without losing meaning.
7. Check completeness: could the reader act on this without asking a question that matters? If not, add only the missing piece.
8. Offer depth, don't preload it. Optionally end with a single line naming what you can expand (for example, "Can detail X or Y.").

## Rules

- Never trade clarity for brevity. If cutting words makes it ambiguous, keep the words.
- Brevity applies to the content, not just the formatting. Fewer bullets beat many tiny ones.
- Don't omit risks, blockers, or decisions the reader must know about.
- Skip detail by default, even if you know it. Include it only when the goal needs it.
