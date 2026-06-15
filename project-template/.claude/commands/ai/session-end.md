Before we close, determine which state applies:

If the active enhancement is still in progress (only some steps done this session):
- ai/context.md — update with what was completed, exactly where we stopped,
  any decisions made, and what to pick up next session
- ai/enhancements/ENHANCEMENTS.md — confirm status is 🔄 In Progress
- No impact scan needed — the enhancement is not closed out yet

If the active enhancement is fully complete this session:
- Run /ai:enhancement-closeout first
- ai/context.md — update with what was built, decisions made, current known issues, what's next
- ai/enhancements/ENHANCEMENTS.md — mark the enhancement ✅ Complete and move its row into the Complete section (keep the board grouped by status)
- ai/blueprint.md — update if any architectural decisions were made this session

If no active enhancement (general session work):
- ai/context.md — update with what was built, decided, or changed
- ai/enhancements/ENHANCEMENTS.md — update any rows that changed state

If you already ran checkpoints and an impact scan during the session, just verify nothing was missed.

Then prompt the user to push — so the repo always captures the updated ai/ files.
