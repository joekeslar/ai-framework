Quick checkpoint update. Capture the delta — and keep `ai/context.md` a lean snapshot.

1. **The active enhancement's `plan.md`** — this is where detail goes. Append to its
   **Execution Log**: what was just built or decided, and anything a future session would
   need to pick up where we stopped.

2. **`ai/context.md`** — snapshot edits only:
   - Replace the one-line `**Last updated:**` (date + one sentence). Never append to it,
     never nest a list under it.
   - Refresh `## Current State` if the phase, status, or active enhancement changed
   - `## Open Issues` — add anything newly discovered; **delete** anything now resolved
     (no strike-through, no resolved history)
   - `## What's Next` — adjust open items; delete anything now done
   - Do NOT add a session narrative here — that's the plan.md Execution Log's job.
     Mid-session checkpoints normally add nothing to `## Recent Sessions`; that gets one
     capped entry at `/ai:session-end`.
   - Architectural decisions go to the `ai/blueprint.md` changelog, not context.md

3. **`ai/enhancements/ENHANCEMENTS.md`** — update the status row for any enhancement that
   changed state this checkpoint, and move it into the matching status section so the board
   stays grouped (open work on top, ✅ Complete at the bottom)

Keep it brief — capture the delta, not the whole picture. A checkpoint should more often
shrink context.md than grow it.
