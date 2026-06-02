# AI Framework Changelog

> Changes to the framework itself — not individual projects.

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
