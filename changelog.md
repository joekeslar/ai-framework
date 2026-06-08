# AI Framework Changelog

> Changes to the framework itself — not individual projects.

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
