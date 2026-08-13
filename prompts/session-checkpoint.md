# Prompt: Session Checkpoint

Run this at natural stopping points during a session — after a decision is made, after an
enhancement changes status, or after meaningful work is completed. Don't wait until the end.

---

## Mid-Session Checkpoint

```
Please do a quick checkpoint update. Capture the delta — and keep ai/context.md a
lean snapshot.

1. The active enhancement's plan.md — this is where detail goes. Append to its
   Execution Log: what was just built or decided, and where we stopped.

2. ai/context.md — snapshot edits only:
   - Replace the one-line "Last updated:" (date + one sentence). Never append to it,
     never nest a list under it.
   - Refresh "Current State" if phase, status, or active enhancement changed
   - "Open Issues" — add anything new; DELETE anything now resolved (no strike-through)
   - "What's Next" — adjust open items; delete anything now done
   - No session narrative here — that's the plan.md Execution Log's job. "Recent
     Sessions" gets one capped entry at session end, not at each checkpoint.
   - Architectural decisions go to the ai/blueprint.md changelog, not context.md

3. ai/enhancements/ENHANCEMENTS.md — update the status row for any enhancement
   that changed state this checkpoint, and move it into the matching status section
   so the board stays grouped (open work on top, ✅ Complete at the bottom)

Keep it brief — a checkpoint should more often shrink context.md than grow it.
```

---

## On Enhancement Close-Out

Run this when marking an enhancement ✅ Complete, before moving on.

```
Before closing out this enhancement, run an impact scan:

1. Read the plan.md for the enhancement just completed
2. Check every open item for potential impact:
   - 🔵 Not Started enhancements — read each plan.md
   - 🔄 In Progress enhancements — read each plan.md
   - 💡 Ideas — read each .md file in ai/enhancements/ideas/
3. For any item where the completed work changes scope, approach, or assumptions:
   - Add a brief impact note directly to that plan.md or idea file — that note is the
     record, and it lives with the work it affects
   - Do NOT copy those notes into ai/context.md. Add a line to "Open Issues" only if
     something is genuinely unresolved and blocks current work — one line, deleted as
     soon as it's resolved

Then close out:
- ai/blueprint.md — architectural decisions go here (Key Technical Decisions + Changelog),
  not in context.md
- ai/enhancements/ENHANCEMENTS.md — mark ✅ Complete and move the row into that section
- ai/context.md — snapshot edits only: replace the one-line "Last updated:", point
  "Active enhancement" at the next one (or "none"), promote the finished work into
  "What's Working" as a short line, and DELETE the Open Issues / What's Next entries
  this enhancement resolved. The narrative of what was built stays in the plan.md
  Execution Log — context.md links to it, it does not restate it.
```
