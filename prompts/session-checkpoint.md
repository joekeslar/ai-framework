# Prompt: Session Checkpoint

Run this at natural stopping points during a session — after a decision is made, after an
enhancement changes status, or after meaningful work is completed. Don't wait until the end.

---

## Mid-Session Checkpoint

```
Please do a quick checkpoint update:

1. ai/context.md — update with anything that changed since the last update:
   - What was just built or decided
   - Any new or resolved known issues
   - Update "Last updated" date and "What's next" if relevant

2. ai/enhancements/ENHANCEMENTS.md — update the status row for any enhancement
   that changed state this checkpoint

Keep it brief — capture the delta, not the whole picture.
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
   - Add a brief impact note directly to that plan.md or idea file
   - Flag it in ai/context.md under "Known Issues" or "What's Next"

Then update ai/context.md and ai/enhancements/ENHANCEMENTS.md as usual.
```
