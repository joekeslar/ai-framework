# CLAUDE.md

> This file is read automatically by Claude Code at the start of every session.
> Keep this in sync with ai/principles.md — they contain the same rules.

---

## First — Read These Files

Before doing anything else, read:
1. `ai/context.md` — current state of the app (what's built, in progress, known issues)
2. `ai/principles.md` — design rules that must not drift
3. The plan.md for the active enhancement — path is in the "Active enhancement" field of context.md

Confirm briefly what you understand about current state and today's goal before starting work.

---

## Who I Am

I am a solo developer building [App Name], a [web app / mobile app / both].
I use Claude Desktop and Claude Code as my AI development tools.

---

## The App

[2–3 sentences. What does this app do? Who uses it?]

---

## Architecture Principles

### Never Do These

- Do not introduce a new framework, navigation library, or routing pattern — use what's in blueprint.md
- Do not add a new state management library without explicit instruction
- Do not create parallel systems — extend existing patterns, don't invent new ones alongside them
- Do not change the design system colors or fonts without explicit instruction
- Do not leave the app in a non-runnable state at the end of a task

### Always Do These

- Follow the established folder structure defined in blueprint.md
- Use design system tokens for all colors, typography, and spacing — never hardcode values
- Write API/service calls in the designated api/ or services/ layer — not inline in components
- Match the code style and patterns already established in existing files
- Make small, safe, incremental changes — not large sweeping rewrites

---

## Design System

**Visual direction:** [e.g., "Clean and minimal. Rounded corners on cards. Consistent 16px padding."]

**Colors:**
- Primary: [hex]
- Background: [hex]
- Text: [hex]
- Accent: [hex]

**Typography:**
- Headings: [Font name]
- Body / UI: [Font name]

---

## After Each Task

When a task or session is complete, update these files automatically — don't wait to be asked:

1. `ai/context.md` — update with:
   - What was built or changed
   - Any decisions made and why
   - Current known issues
   - What's next

2. `ai/enhancements/ENHANCEMENTS.md` — update the status row for any enhancement that changed state (started, completed, or newly added)
