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
Before closing, determine which state applies:

If the active enhancement is still in progress (only some steps done this session):
1. ai/context.md — update with what was completed, exactly where we stopped,
   any decisions made, and what to pick up next session
2. ai/enhancements/ENHANCEMENTS.md — confirm status is 🔄 In Progress
No impact scan needed — the enhancement is not closed out yet.

If the active enhancement is fully complete this session:
1. Run the impact scan (use prompts/session-checkpoint.md — On Enhancement Close-Out)
2. ai/context.md — update with what was built, decisions made, known issues, what's next
3. ai/enhancements/ENHANCEMENTS.md — mark the enhancement ✅ Complete and move its row into the Complete section (keep the board grouped by status)
4. ai/blueprint.md — update if any architectural decisions were made this session

If no active enhancement (general session work):
1. ai/context.md — update with what was built, decided, or changed
2. ai/enhancements/ENHANCEMENTS.md — update any rows that changed state

If you ran checkpoints and an impact scan during the session, just verify nothing was missed.

Then prompt me to push — so the repo always captures the updated ai/ files.
```

> Use prompts/session-checkpoint.md to run checkpoints and impact scans mid-session.
