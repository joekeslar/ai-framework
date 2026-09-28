# [App Name] — Current Context
**Last updated:** [Date] — [one sentence: the most recent meaningful change]

> **How to maintain this file — it is a SNAPSHOT, not a log.**
> Claude reads this at the start of every session, so every line has a recurring cost.
> Bias every edit toward smaller.
>
> - `**Last updated:**` is ONE line: date + one sentence. **Replace** it each time — never
>   append to it, never nest a changelog under it.
> - Per-session narrative detail goes in the active enhancement's `plan.md` **Execution Log**.
>   Link to it from here; don't retell it here.
> - `## Recent Sessions` is capped at ~3 one-line entries. Adding one means deleting the oldest.
> - `## Open Issues` holds **unresolved** items only. Delete an item when it's resolved — no
>   strike-through history.
> - `## What's Next` holds open items only. Delete completed ones.
> - Architectural decisions go in the `ai/blueprint.md` changelog, not here.
> - Prefer a pointer over a restatement — link `ENHANCEMENTS.md`, `plan.md`, `blueprint.md`
>   instead of duplicating them.
> - `## Key Facts` is the durable reference core — only what nearly every session needs, plus an
>   index into `ai/key-facts.md`, where subsystem gotchas live. Prune only what the code superseded.
> - History worth keeping but not worth re-reading every session goes to `ai/context-archive.md`,
>   which is **not** in the session-start read list. If this file has already grown past the
>   skeleton below, run `/ai:context-pare-down`.

---

## Current State

**Build phase:** [e.g., Foundation, Active development, Enhancement phase]
**Overall status:** [one or two sentences — e.g., Core app running. Auth complete. Working on home screen.]
**Active enhancement:** [`ai/enhancements/003-search/plan.md` — or "none"]

---

## Recent Sessions

> Rolling, max ~3. One line each: date — what happened → link to its plan.md. Drop the oldest.

- [Date] — [one line] → [`ai/enhancements/NNN-name/plan.md`](enhancements/NNN-name/plan.md)

---

## What's Working

- [Feature or area that is complete and stable]

---

## Open Issues

> Unresolved only. Delete an item when it's fixed.

- [Issue — note if blocker or low priority]

---

## What's Next

- [ ] [Next task or enhancement]

---

## Key Facts [the AI] Should Know

> What nearly every session needs. Subsystem gotchas live in [`ai/key-facts.md`](key-facts.md),
> which is **not** read at session start — before touching an area in the index below, read its
> section. A new fact goes there unless nearly every session needs it; prune only superseded entries.

- [e.g., "All API calls go through a central client module — never call fetch directly in a component"]
- [e.g., "Dev server runs on :3000, API on :8787"]
- [e.g., "DB migrations: `npm run db:migrate` — never edit past migration files"]
- [e.g., "Copy .env.example to .env to run locally; OAuth redirect must be the exact localhost URL"]

**Before you touch an area, read its section of [`key-facts.md`](key-facts.md):**

| Area | Section |
|---|---|
| [packages, directories, commands or words that mark the area] | [Section](key-facts.md#section) |

---

## Pointers

- **Enhancement board:** [`ai/enhancements/ENHANCEMENTS.md`](enhancements/ENHANCEMENTS.md) — status of all work
- **Active plan + execution log:** see `Active enhancement` above
- **Architecture & decisions:** [`ai/blueprint.md`](blueprint.md)
- **Design rules:** [`ai/principles.md`](principles.md)
- **Product spec:** [`ai/spec.md`](spec.md)
- **Subsystem gotchas:** [`ai/key-facts.md`](key-facts.md) — read by section, never at session start
- **Frozen history:** [`ai/context-archive.md`](context-archive.md) — created lazily, never read at session start
