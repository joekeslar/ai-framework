# AI Framework Changelog

> Changes to the framework itself — not individual projects.

---

## v1.6 — 2026-06-15

### Added
- `project-template/ai/enhancements/status.sh` — read-only script that renders `ENHANCEMENTS.md` as a colored, grouped board in the terminal (🔄 In Progress / 🔵 Not Started / 🟣 Split / 💡 Ideas on top, ✅ Complete collapsed at the bottom). Run from `ai/enhancements/`.
- `project-template/.claude/commands/ai/board.md` — `/ai:board` slash command that runs `status.sh` and prints the enhancement board without leaving the chat.

### Changed
- `project-template/ai/enhancements/ENHANCEMENTS.md` — reworked from a single flat table into a status board: one table per status section, open work on top, ✅ Complete collapsed at the bottom. Added a status key and maintenance note.
- `project-template/CLAUDE.md`, `project-template/.claude/commands/{session-checkpoint,session-end}.md`, `prompts/{session-checkpoint,session-start}.md` — close-out/checkpoint steps now say to **move** the row into the matching status section (keep the board grouped), not just edit it in place.
- `project-template/.claude/commands/session-end.md` + `prompts/session-start.md` (End of Session) — folded in two refinements proven in the NutriVibing project: on full close-out, **update `ai/blueprint.md` if any architectural decisions were made**; and **prompt to push at the end** so the repo always captures the updated `ai/` files. New projects now get these by default.
- `project-template/ai/enhancements/ideas/README.md` — promoting an idea now means strike it through in `ENHANCEMENTS.md` **and delete its file from `ideas/`**, so the folder stays a true list of only-still-unplanned ideas.
- `START-HERE.md` — folder-structure diagrams now show `status.sh` and describe `ENHANCEMENTS.md` as a status board.
- **Slash commands moved into the `/ai:` namespace.** All five commands now live in `project-template/.claude/commands/ai/` and are invoked as `/ai:session-start`, `/ai:session-checkpoint`, `/ai:enhancement-closeout`, `/ai:session-end`, `/ai:board` — so framework commands group together and are easy to tell apart from project-specific or built-in commands. Updated all references in `START-HERE.md`, the `/ai:session-end` command (which calls `/ai:enhancement-closeout`), and project READMEs.

### Design decisions
- `status.sh` reads `ENHANCEMENTS.md` (the one artifact Claude maintains every session) rather than re-scanning each `NNN-/plan.md`. The per-folder `plan.md` status lines are written once and drift; reading the maintained index means the terminal board can never disagree with the file. This was chosen after the first cut — which scanned `plan.md` files — surfaced real drift in a live project (several completed enhancements still said "Not Started" in their folder headers).
- The board groups by status instead of sorting by number so the few open items aren't buried among dozens of completed rows — the original complaint that prompted this change.

---

## v1.5 — 2026-06-09

### Added
- `project-template/.claude/commands/` — four Claude Code slash commands copied into every new project:
  - `session-start.md` — `/session-start`
  - `session-checkpoint.md` — `/session-checkpoint`
  - `enhancement-closeout.md` — `/enhancement-closeout`
  - `session-end.md` — `/session-end`

### Changed
- `prompts/session-start.md` — End of Session section rewritten to distinguish three states: enhancement in progress (partial steps done), enhancement fully complete, and no active enhancement. Impact scan only triggered on full completion, not partial close-out.
- `START-HERE.md` — Day-to-Day Workflow now includes slash command callouts for each step; Project Folder Structure and Framework Files Reference updated to show `.claude/commands/`

### Design decisions
- Slash commands live in `project-template/.claude/commands/` so they are copied automatically when starting a new project — no separate setup step required
- Session-end distinguishes partial from complete enhancement close-out to support multi-session enhancement workflows where only some steps are done in a given session
- `/session-end` calls `/enhancement-closeout` by reference rather than duplicating the impact scan logic — one source of truth for the scan procedure

---

## v1.4 — 2026-06-09

### Added
- `prompts/session-checkpoint.md` — new prompt for mid-session incremental doc updates and enhancement close-out impact scans

### Changed
- `prompts/session-start.md` — Full Session Start now includes a recovery check (stale context.md detection and active plan freshness validation); End of Session now references session-checkpoint.md and is leaner — just a verify step when checkpoints were run during the session
- `project-template/ai/principles.md` — Context Management section rewritten around incremental checkpoints rather than batch-at-end updates; added impact scan and plan freshness check rules
- `project-template/CLAUDE.md` — After Each Task section rewritten to match; added impact scan on close-out and plan validation before implementation
- `START-HERE.md` — Day-to-Day Workflow now has a "During a session" subsection covering checkpoints, impact scans, and pre-implementation plan validation; Framework Files Reference updated to include session-checkpoint.md

### Design decisions
- Shifted from batch-at-end doc updates to incremental checkpoints throughout the session — reduces data loss when a session closes without a formal close-out
- Impact scan on enhancement close-out covers Not Started enhancements, In Progress enhancements, and all idea files in ideas/ — ensures open plans and unpromoted ideas are flagged when completed work changes their scope
- Pre-implementation plan freshness check added as a second safety net for plans that were written before subsequent enhancements changed the app

---

## v1.3 — 2026-06-08

### Fixed
- `project-template/CLAUDE.md` — "After Each Task" now includes `ENHANCEMENTS.md`; previously only `context.md` was listed, causing ENHANCEMENTS.md to be skipped in Claude Code sessions
- `project-template/ai/principles.md` — "Context Management" now includes `ENHANCEMENTS.md` in end-of-session update instructions; same gap existed for Claude Desktop users
- `START-HERE.md` — Claude Desktop setup step simplified; principles.md now carries the full session rules, so no separate instruction line is needed

---

## v1.2 — 2026-06-05

### Added
- `ENHANCEMENTS.md` status index to project template (`ai/enhancements/ENHANCEMENTS.md`)
- Status key: ✅ Complete · 🔄 In Progress · 🔵 Not Started · 💡 Idea
- Ideas tracked in ENHANCEMENTS.md alongside enhancements — one place to look for everything
- `ENHANCEMENTS.md` added to document governance table in START-HERE.md

### Changed
- `prompts/session-start.md` — end-of-session protocol now includes updating `ENHANCEMENTS.md` when an enhancement or idea changes state
- `START-HERE.md` — folder structure diagram and framework files reference updated to include `ENHANCEMENTS.md`; session-ending description updated
- Standard Enhancement workflow in START-HERE.md notes ENHANCEMENTS.md update on completion

---

## v1.1 — 2025-05-29

### Added
- Right-size guide in START-HERE.md — three tiers (quick fix / standard enhancement / full build)
- Document governance table in START-HERE.md — when each file changes and who updates it
- templates/idea.md — parking lot for ideas not ready to plan
- templates/pre-launch-checklist.md — app store and production release checklist
- ideas/ folder in project template enhancements directory
- Regression check field in enhancement template

### Changed
- START-HERE.md restructured around right-sizing principle
- Project folder structure now shows ideas/ parking lot

---

## v1.0 — 2025-05-29

### Added
- Initial framework structure
- START-HERE.md with setup and day-to-day workflow guide
- project-template/ with spec.md, blueprint.md, principles.md, context.md, changelog.md
- project-template/ai/enhancements/001-foundation/plan.md starter enhancement
- templates/enhancement.md for features, bug fixes, and refactors
- prompts/idea-to-spec.md
- prompts/spec-to-blueprint.md
- prompts/blueprint-to-todo.md
- prompts/session-start.md

### Design decisions
- Kept structure flat and minimal — no governance layers, no archival systems
- principles.md doubles as Claude Desktop Instructions content — one source of truth
- context.md is Claude-maintained to reduce manual overhead
- Enhancement folders use NNN-name convention for natural sort ordering
