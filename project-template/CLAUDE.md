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

Update docs at natural checkpoints throughout the session — don't batch everything to the end:

1. `ai/context.md` — **a lean snapshot, not a log.** It is read at the start of every session,
   so every line costs. Bias every edit toward smaller:
   - `**Last updated:**` is ONE line — date + one sentence. **Replace** it each time. Never
     append to it, never nest a changelog under it.
   - Per-session narrative detail goes in the active enhancement's `plan.md` **Execution Log** —
     not here. context.md links to it.
   - `## Recent Sessions` is a rolling list capped at ~3 one-line entries, each pointing at its
     plan.md. Adding one means dropping the oldest.
   - `## Open Issues` holds unresolved items only — **delete** them when resolved. No
     strike-through history.
   - `## What's Next` holds open items plus a single launch tracker — delete completed ones.
   - Architectural decisions go in the `ai/blueprint.md` changelog, not a table in context.md.
   - Prefer a pointer over a restatement — link `ENHANCEMENTS.md`, `plan.md`, `blueprint.md`.
   - Keep the durable `## Key Facts` reference core (ports, commands, env/OAuth gotchas);
     prune only superseded entries.
   - History worth keeping but not worth re-reading lives in `ai/context-archive.md` — created
     lazily, never in the session-start read list. If context.md has already grown into a log,
     run `/ai:context-pare-down`.

2. `ai/enhancements/ENHANCEMENTS.md` — the status board. Update the row whenever an
   enhancement changes state (started, completed, or newly added), and move it into the
   matching status section so the board stays grouped — 🔄 In Progress and 🔵 Not Started
   on top, ✅ Complete collapsed at the bottom. When an idea is promoted to an enhancement,
   strike it through in the Ideas section and delete its file from `ai/enhancements/ideas/`.
   Run `ai/enhancements/status.sh` for the same board in the terminal.

3. **When completing an enhancement** — run an impact scan before closing it out:
   - Read all Not Started and In Progress enhancement plan.md files
   - Read all idea files in `ai/enhancements/ideas/`
   - If the completed work changes scope, approach, or assumptions for any of them,
     add a brief note directly to that file

4. **When picking up a Not Started enhancement** — confirm the plan still holds before
   implementing. Check what's been completed since the plan was written and flag any
   mismatches before writing code.
