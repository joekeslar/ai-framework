# Prompt: Session Start

Paste this at the beginning of a Claude session, or save it as a snippet in Claude Desktop.
Attach the relevant files as noted.

---

## Full Session Start (attach all three files)

```
Before we begin, please read these files to restore your context for this project:

1. ai/principles.md — design rules you must follow throughout this session
2. ai/context.md — current state of the app (what's built, what's in progress, known issues)
3. The plan.md for the active enhancement — path is in the "Active enhancement" field of context.md

Then do a quick recovery check:
- Note the "Last updated" date in context.md — if it looks older than our last session,
  flag it before we start (the previous session may have closed without a checkpoint)
- If there's an active enhancement plan, confirm its assumptions still hold given what's
  been completed since the plan was written — flag any mismatches before implementing

Once you've done this, briefly confirm:
- Your understanding of where the app is at
- What we're working on today
- Any stale docs or plan concerns to resolve before starting

Then we'll begin.
```

---

## Quick Session Start (for simple sessions — use when not attaching files)

> Use this for small changes or quick questions within an ongoing conversation where
> Claude already has context. For a fresh session, use the Full Session Start above.

```
We're continuing work on [App Name].

Before we start, read these files:
- ai/principles.md — design rules to follow
- ai/context.md — current state of the app
- ai/blueprint.md — architecture reference if needed

Current state: [one sentence — e.g., "Auth is complete, working on the home screen"]
Today's goal: [one sentence — e.g., "Build the EstimateCard component"]

Let's go.
```

---

## End of Session

```
Before closing, determine which state applies. In every case: narrative detail goes in
the active enhancement's plan.md Execution Log, and ai/context.md stays a lean snapshot
that POINTS at it (contract below).

If the active enhancement is still in progress (only some steps done this session):
1. The active plan.md — append a dated Execution Log entry: what was completed, exactly
   where we stopped, decisions made, what to pick up next session
2. ai/context.md — snapshot only: replace the one-line "Last updated:", refresh
   "Current State", add ONE "Recent Sessions" line pointing at that plan.md (drop the
   oldest to stay at ~3)
3. ai/enhancements/ENHANCEMENTS.md — confirm status is 🔄 In Progress
No impact scan needed — the enhancement is not closed out yet.

If the active enhancement is fully complete this session:
1. Run the impact scan (use prompts/session-checkpoint.md — On Enhancement Close-Out)
2. The completed plan.md — make sure its Execution Log is the complete record of what
   was built; don't re-tell that story in context.md
3. ai/blueprint.md — record any architectural decisions (Key Technical Decisions +
   Changelog row). Decisions live there, NOT in context.md
4. ai/context.md — snapshot only: replace "Last updated:"; set "Active enhancement" to
   the next one (or "none"); add one "Recent Sessions" line (cap ~3); promote finished
   work into "What's Working"; DELETE resolved Open Issues and completed What's Next items
5. ai/enhancements/ENHANCEMENTS.md — mark the enhancement ✅ Complete and move its row
   into the Complete section (keep the board grouped by status)

If no active enhancement (general session work):
1. ai/context.md — same snapshot rules: one-line "Last updated:", refresh Current State,
   one capped Recent Sessions line, remove anything now resolved
2. ai/enhancements/ENHANCEMENTS.md — update any rows that changed state

If you ran checkpoints and an impact scan during the session, just verify nothing was missed.

The ai/context.md contract — context.md is read at the start of every session, so every
line has a recurring cost. Bias every edit toward smaller:
- "Last updated:" is ONE line — date + one sentence. Replace it; never append, never
  nest a changelog under it
- Per-session narrative belongs in the active plan.md Execution Log; context.md links to it
- "Recent Sessions" is capped at ~3 one-line entries, each pointing to its plan.md
- "Open Issues" holds unresolved items only — remove resolved ones outright
- "What's Next" holds open items plus a single launch tracker — delete completed ones
- Architectural decisions go in the blueprint.md changelog, not a table in context.md
- Prefer pointers to ENHANCEMENTS.md / plan.md / blueprint over restating them
- KEEP the durable "Key Facts" reference core; prune only superseded entries
- Older history is frozen in ai/context-archive.md, which is never read at session start

Before saving: if context.md is longer than it was at the start of the session, find what
to delete.

Then prompt me to push — so the repo always captures the updated ai/ files.
```

> Use prompts/session-checkpoint.md to run checkpoints and impact scans mid-session.
