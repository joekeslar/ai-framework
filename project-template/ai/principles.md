# [App Name] — Design Principles

> **Important:** Paste this into the Claude Desktop Project Instructions field for this app.
> Claude must follow all of these in every session without being reminded.
> When principles change, update this file AND the Claude Desktop Instructions.

---

## Who I Am

I am a solo developer building [App Name], a [web app / mobile app / both] built with [stack — filled in after blueprint].
I use Claude Desktop and Claude Code as my primary AI development tools.

---

## The App

[2–3 sentences. What does this app do? Who uses it?]

Key files for context:
- `ai/spec.md` — full product specification
- `ai/blueprint.md` — technical architecture
- `ai/context.md` — current build state (read this at the start of every session)

---

## Architecture Principles

### Never Do These

- Do not introduce a new framework, navigation library, or routing pattern — use what's established in blueprint.md
- Do not add a new state management library without explicit instruction
- Do not create parallel systems — extend existing patterns, don't invent new ones alongside them
- Do not change the design system colors or fonts without explicit instruction
- Do not leave the app in a non-runnable state at the end of a task

### Always Do These

- Follow the established folder structure defined in blueprint.md
- Use design system tokens for all colors, typography, and spacing — never hardcode values
- Write API/service calls in the designated api/ or services/ layer — not inline in components or screens
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

## Enhancement & Bug Fix Approach

- Prefer extending existing code over replacing it
- Prefer refactoring over rewriting
- If a pattern already exists for something, follow it — don't introduce a competing approach
- Small, safe, incremental steps — not large sweeping changes in one go
- Every change should leave the app in a working, runnable state

---

## Context Management

- At the start of each session: read `ai/context.md` and note the "Last updated" date — flag it if it looks stale before starting work
- If there's an active enhancement plan, confirm its assumptions still hold given what's been completed since it was written — flag mismatches before implementing
- Run checkpoint updates throughout the session — after decisions, status changes, or meaningful work — not just at the end
- **`context.md` is a lean snapshot, not a log.** It is read at the start of every session, so
  every line costs. Bias every edit toward smaller:
  - `**Last updated:**` is ONE line — date + one sentence. **Replace** it each time. Never append to it, never nest a changelog under it
  - Per-session narrative detail goes in the active enhancement's `plan.md` **Execution Log** — not here. context.md links to it
  - `## Recent Sessions` is a rolling list capped at ~3 one-line entries, each pointing at its plan.md. Adding one means dropping the oldest
  - `## Open Issues` holds unresolved items only — delete them when resolved. No strike-through history
  - `## What's Next` holds open items plus a single launch tracker — delete completed ones
  - Architectural decisions go in the `ai/blueprint.md` changelog, not a table in context.md
  - Prefer a pointer over a restatement — link `ENHANCEMENTS.md`, `plan.md`, `blueprint.md`
  - Keep the durable `## Key Facts` reference core (ports, commands, env/OAuth gotchas) to what nearly every session needs. A gotcha that belongs to one area goes in that area's section of `ai/key-facts.md` — never read at session start, read by section before touching the area — and the index under `## Key Facts` names the area. Prune only superseded entries
  - History worth keeping but not worth re-reading lives in `ai/context-archive.md` — created lazily, never in the session-start read list. If context.md has already grown into a log, pare it down (`/ai:context-pare-down` in Claude Code): archive the current file verbatim first, then rewrite it lean
- When completing an enhancement, run an impact scan before closing it out:
  - Check all Not Started and In Progress enhancement plan.md files
  - Check all idea files in `ai/enhancements/ideas/`
  - Note any scope, approach, or assumption changes in the affected file
- At end of session: verify `ai/context.md` and `ai/enhancements/ENHANCEMENTS.md` are current — if checkpoints were run during the session, this is just a quick check
- `ENHANCEMENTS.md` is a status board — when a status changes, move the row into the matching section (open work on top, ✅ Complete collapsed at the bottom). When an idea is promoted, strike it through and delete its file from `ideas/`. Run `ai/enhancements/status.sh` for the same board in the terminal

---

## What I Care About

- **Consistency over novelty** — predictable patterns beat clever new approaches
- **No drift** — the app should feel like one coherent system, not features layered on top of each other
- **Working at every step** — I want to be able to run the app after every meaningful change
- **Maintainability** — I will be supporting these apps for years; write code I can understand and change
