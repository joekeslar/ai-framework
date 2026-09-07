---
description: Close the session — update plan.md, context.md, and the board, then push
---

Before we close, determine which state applies.

In every case: **narrative detail goes in the active enhancement's `plan.md` Execution Log.
`ai/context.md` is a lean snapshot that POINTS at it** — see the contract at the bottom.

**If the active enhancement is still in progress** (only some steps done this session):
- The active `plan.md` — append a dated entry to its **Execution Log**: what was completed,
  exactly where we stopped, decisions made, what to pick up next session. This is where the
  detail lives.
- `ai/context.md` — snapshot only: replace the one-line `**Last updated:**`, refresh
  `## Current State`, add ONE `## Recent Sessions` line pointing at that plan.md (drop the
  oldest to stay at ~3)
- `ai/enhancements/ENHANCEMENTS.md` — confirm status is 🔄 In Progress
- No impact scan needed — the enhancement is not closed out yet

**If the active enhancement is fully complete this session:**
- Run `/ai:enhancement-closeout` first
- The completed `plan.md` — make sure its Execution Log is the complete record of what was
  built; do not re-tell that story in context.md
- `ai/blueprint.md` — record any architectural decisions in "Key Technical Decisions" and add
  a Changelog row. Decisions live there, **not** in context.md
- `ai/context.md` — snapshot only: replace `**Last updated:**`; set `Active enhancement` to the
  next one (or "none"); add one `## Recent Sessions` line (cap ~3); promote finished work into
  `## What's Working`; **delete** resolved `## Open Issues`; **delete** completed `## What's Next`
  items
- `ai/enhancements/ENHANCEMENTS.md` — mark ✅ Complete and move its row into the Complete
  section (keep the board grouped by status)

**If no active enhancement** (general session work):
- `ai/context.md` — same snapshot rules: one-line `**Last updated:**`, refresh Current State,
  one capped Recent Sessions line, remove anything now resolved
- `ai/enhancements/ENHANCEMENTS.md` — update any rows that changed state

If you already ran checkpoints and an impact scan during the session, just verify nothing was missed.

---

## The ai/context.md contract — do not violate it

context.md is loaded at the start of every session, so every line has a recurring cost.
Bias every edit toward **smaller**.

- `**Last updated:**` is ONE line — date + one sentence. **Replace** it. Never append to it,
  never nest a changelog or bullet list under it.
- Per-session narrative belongs in the active `plan.md` Execution Log. context.md links to it.
- `## Recent Sessions` is a rolling list capped at ~3 one-line entries, each pointing to its
  plan.md. Adding one means deleting the oldest.
- `## Open Issues` holds **unresolved** items only. Remove resolved ones outright — no
  strike-through-and-keep, no resolved-issue graveyard.
- `## What's Next` holds open items plus a single launch tracker. Delete checked-off items.
- Architectural decisions go in the `ai/blueprint.md` changelog, not a table here.
- Prefer a pointer over a restatement — link `ENHANCEMENTS.md`, `plan.md`, `blueprint.md`
  rather than duplicating their content.
- KEEP the durable `## Key Facts` reference core (ports, migration commands, env/OAuth
  gotchas). Prune only entries the code has actually superseded.

**Before saving:** if context.md is longer than it was at the start of the session, find what
to delete. If it has already drifted well past the lean skeleton, say so and offer
`/ai:context-pare-down`.

Then prompt the user to push — so the repo always captures the updated `ai/` files.
