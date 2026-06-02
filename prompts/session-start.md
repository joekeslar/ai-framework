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

Once you've read them, briefly confirm:
- Your understanding of where the app is at
- What we're working on today
- Any questions before we start

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

## End of Session (ask Claude to do this before closing)

```
Please update the project files to reflect this session:

1. ai/context.md — update with:
   - What we built or changed
   - Any decisions made and why
   - Current known issues
   - What's next

2. ai/blueprint.md — if any architectural decisions were made this session,
   update the relevant sections and log the change in the blueprint changelog

Keep context.md concise — it's a status snapshot, not documentation.
```
