# AI Framework Changelog

> Changes to the framework itself — not individual projects.

---

## v1.8 — 2026-09-28

**Theme: Key Facts in two tiers.** v1.7 capped every section of `ai/context.md` except
`## Key Facts`, which every command kept in full. In a mature project that exemption became most
of the file. In Cornicione Perfected, Key Facts was 71% of a 41 KB context.md, and a v1.7
pare-down cut the file by only 1%. Every entry was still current, but only 9 of 66 were needed
in nearly every session. This release keeps every fact and moves the ones that belong to one
area out of the session-start read path.

### The contract
- `## Key Facts` in context.md holds only what nearly every session needs, plus an index that
  maps each area to a section of `ai/key-facts.md`
- `ai/key-facts.md` holds area gotchas under one `##` heading per area. It is never read in full
  at session start, and a section is read before touching its area
- The placement test: would a session that never touches this area still need this fact? When
  unsure, the fact goes in `key-facts.md`
- A new section and its index row are added in the same edit. Prune only superseded entries

### Added
- **`ai/key-facts.md` convention**: created lazily by `/ai:session-end` for the first fact that
  belongs to one area, and read by section. The template ships no empty copy.
- `/ai:context-pare-down` **Step 4b — Split Key Facts**: sorts entries with the placement test
  and moves area entries verbatim. A hard gate then verifies that every entry line, including
  indented continuation lines and any existing `key-facts.md`, appears exactly once across the
  two files, and that every section has an index row. Corrections (superseded entries, compound
  entries split) come after the gate, as a separate reported pass.

### Changed
- `project-template/ai/context.md`: the Key Facts bullet in the maintenance note, the Key Facts
  note, an index placeholder under the example entries, and a `## Pointers` line
- `project-template/CLAUDE.md` and `project-template/ai/principles.md`: the Key Facts bullet,
  in the same words in both. `CLAUDE.md`'s "First — Read These Files" list gains the key-facts
  read, matching `/ai:session-start`
- `project-template/.claude/commands/ai/session-start.md`: reads the plan's key-facts sections
- `project-template/.claude/commands/ai/session-end.md`: routes an area gotcha to its section,
  states the placement test, and gives the header for a newly created `key-facts.md`
- `project-template/.claude/commands/ai/context-pare-down.md`: Step 4 carries Key Facts forward
  **verbatim**. It no longer allows a superseded entry to be dropped mid-rewrite, because that
  would make the Step 4b gate fail; pruning moved to the post-gate correction pass. Preflight
  and the report now include byte sizes and `key-facts.md`, and all three files are committed
  together
- `prompts/session-start.md` (Claude Desktop): Full Session Start reads the plan's key-facts
  sections, and the End of Session contract routes area gotchas
- `START-HERE.md`: the Key Facts bullet, a new `### ai/key-facts.md` subsection, the
  remediation steps and upgrade instructions, the governance table and the folder diagram

### Unchanged (deliberately)
- `session-checkpoint.md` (command and prompt) and `enhancement-closeout.md`: none of them
  writes Key Facts
- The rules that must never be broken stay as one-liners in `CLAUDE.md`'s "Never Do These".
  `key-facts.md` holds the *why* and the *how*

### Design decisions
- Key Facts only grows. Each entry records a failure the code doesn't make visible, and the
  warning outlives the fix. Pruning deletes the record that prevents a regression, and the
  archive is never read, so neither option works. Moving area facts out of the read path does.
- The index lives in context.md, not in key-facts.md, so a session knows which section to
  read without opening the file. Areas are named by what a session is about to open, not by
  category, so the match happens at the moment it matters.
- The split is verified verbatim before any correction, for the same reason as the archive:
  a move that also rewrites can lose something without anyone noticing.
- Nested per-directory `CLAUDE.md` files were considered and deferred. The framework also
  serves Claude Desktop, many areas don't map to one directory, and facts scattered across the
  tree stop being maintained as a set.
- Proven in Cornicione Perfected: context.md went from 41,211 to 17,143 bytes (about 10.3k to
  4.3k tokens at session start), and all 66 facts were kept.

---

## v1.7 — 2026-08-13

**Theme: `ai/context.md` is a lean snapshot, not a log.** Live projects were developing severe
context.md bloat — it's loaded at the start of every session, and the framework's own
conventions told each session to append its full narrative to it, with no size cap and nowhere
else for detail to go. This release removes the instructions that caused the growth, gives the
narrative a proper home, and adds a safe one-time remediation for projects already bloated.

### The contract (installed everywhere)
- `**Last updated:**` is ONE line — date + one sentence, **replaced** each time. Never appended
  to, never a nested changelog
- Per-session narrative detail goes in the active enhancement's `plan.md` **Execution Log**;
  context.md points at it
- `## Recent Sessions` — rolling, capped at ~3 one-line entries, each linking its plan.md
- `## Open Issues` — unresolved only; resolved items are deleted, not struck through
- `## What's Next` — open items plus a single launch tracker; no completed-checklist buildup
- Architectural decisions go in the `ai/blueprint.md` changelog, not a table in context.md
- Prefer pointers to `ENHANCEMENTS.md` / `plan.md` / `blueprint.md` over restating them
- The durable `## Key Facts` reference core stays; prune only superseded entries

### Added
- `project-template/.claude/commands/ai/context-pare-down.md` — `/ai:context-pare-down`, a
  one-time, opt-in remediation for an already-bloated project. Copies the current `context.md`
  **verbatim** into `ai/context-archive.md`, **diff-verifies** it as a hard gate (nothing is
  trimmed until the diff is clean), then rewrites `context.md` to the lean skeleton carrying
  forward current state plus the full Key Facts reference core. Reports before/after line
  counts and what was dropped by category.
- **`ai/context-archive.md` convention** — frozen history, created lazily, **never in the
  session-start read list**. The file stays in the repo; it's only out of the read path.
- **Execution Log** section in `templates/enhancement.md` and
  `project-template/ai/enhancements/001-foundation/plan.md` — the new home for per-session
  narrative. Both templates also note that architectural decisions belong in `blueprint.md`.

### Changed
- `project-template/ai/context.md` — reshaped to a lean skeleton with the maintenance rules
  baked in as a blockquote near the top. **Removed** the `Enhancement Roadmap` (duplicated
  `ENHANCEMENTS.md`), the cumulative `Recent Decisions` table (belongs in blueprint.md), and
  `Known Issues` kept as struck-through history. **Added** `## Recent Sessions` (capped),
  `## Open Issues` (unresolved only), and `## Pointers`.
- `project-template/.claude/commands/ai/session-end.md` — the primary bloat driver. "Update
  context.md with what was built, decisions made, known issues, what's next" (no cap, nowhere
  else to put detail) replaced with: detail → plan.md Execution Log, decisions → blueprint.md,
  context.md gets a replaced one-line `Last updated` and one capped Recent Sessions entry.
  Carries the full contract, plus a "if context.md grew this session, find what to delete" check.
- `project-template/.claude/commands/ai/session-checkpoint.md` — checkpoints now write detail to
  the plan.md Execution Log and make only snapshot edits to context.md; they add nothing to
  Recent Sessions (that's one entry at session end).
- `project-template/.claude/commands/ai/enhancement-closeout.md` — impact notes now live only in
  the affected `plan.md`/idea file. The "Flag it in ai/context.md under Known Issues or What's
  Next" instruction — which fed a Known-Issues graveyard — is gone; context.md gets a line only
  for genuinely unresolved blockers, deleted on resolution.
- `project-template/CLAUDE.md` ("After Each Task", item 1) and `project-template/ai/principles.md`
  ("Context Management") — both restate the contract, kept in sync as declared.
- `prompts/session-checkpoint.md` and `prompts/session-start.md` (End of Session) — the Claude
  Desktop mirrors of those commands, updated to match so both entry points enforce the same rules.
- `START-HERE.md` — new "Keeping context.md Lean" section covering the contract, the archive
  convention, and the remediation procedure; governance table and both folder diagrams updated.

### Unchanged (deliberately)
- `project-template/.claude/commands/ai/session-start.md` — read list untouched, and confirmed
  it does **not** read `ai/context-archive.md`. It reads `principles.md`, `context.md`, and the
  active `plan.md` only.
- Remediation is opt-in per project; nothing here rewrites an existing project automatically.

### Design decisions
- The bloat was an instruction problem, not a discipline problem: every command said "append,"
  none said "cap" or "delete," and there was no other place for narrative detail. Adding an
  Execution Log to plan.md was a precondition for capping context.md — without a destination,
  a cap just loses information.
- The archive is verified by `diff` against an untouched scratch copy of the original, and the
  remediation is instructed to stop dead on any mismatch. Bloat is annoying; silent data loss
  during cleanup is worse, so the trim is gated on a proven-good copy.
- `plan.md` Execution Logs are allowed to grow without bound — a plan.md is read only while its
  enhancement is active, so its size is a per-enhancement cost, not a per-session one.
- Decisions were routed to `blueprint.md` rather than a context.md table because the blueprint
  is already the durable architecture record with a changelog — the context.md table was a
  second, unbounded copy of it.

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
