# AI Framework Changelog

> Changes to the framework itself — not individual projects.

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
