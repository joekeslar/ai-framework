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

- At the start of each session: read `ai/context.md` for current build state
- At the end of each session, update:
  - `ai/context.md` — what was built, decided, or changed
  - `ai/enhancements/ENHANCEMENTS.md` — status for any enhancement that started, completed, or was added
- If a significant architectural decision is made mid-session, note it in `ai/context.md` immediately

---

## What I Care About

- **Consistency over novelty** — predictable patterns beat clever new approaches
- **No drift** — the app should feel like one coherent system, not features layered on top of each other
- **Working at every step** — I want to be able to run the app after every meaningful change
- **Maintainability** — I will be supporting these apps for years; write code I can understand and change
