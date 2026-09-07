---
description: Close out a completed enhancement with an impact scan across open work
---

This enhancement is complete. Before marking it done, run an impact scan:

1. Read the `plan.md` for the enhancement just completed
2. Check every open item for potential impact:
   - All Not Started enhancements — read each `plan.md`
   - All In Progress enhancements — read each `plan.md`
   - All idea files in `ai/enhancements/ideas/`
3. For any item where the completed work changes scope, approach, or assumptions:
   - Add a brief impact note **directly to that plan.md or idea file** — that note is the
     record, and it lives with the work it affects
   - Do NOT copy those notes into `ai/context.md`. Add a line to `## Open Issues` only if
     something is genuinely unresolved and blocks current work — one line, and it gets
     deleted as soon as it's resolved

Then close out:

- **`ai/blueprint.md`** — any architectural decisions from this enhancement go in "Key
  Technical Decisions" plus a Changelog row. Not in context.md.
- **`ai/enhancements/ENHANCEMENTS.md`** — mark this enhancement ✅ Complete and move its row
  into the Complete section
- **`ai/context.md`** — snapshot edits only: replace the one-line `**Last updated:**`, point
  `Active enhancement` at the next one (or "none"), promote the finished work into
  `## What's Working` as a short line, and **delete** the `## Open Issues` and `## What's Next`
  entries this enhancement resolved. The narrative of what was built stays in the plan.md
  Execution Log — context.md links to it, it does not restate it.
