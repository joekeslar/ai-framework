# AI Framework — Start Here

A lightweight framework for building AI-assisted applications as a solo developer with Claude. Designed to keep Claude oriented across sessions and prevent design drift as apps grow over time.

---

## What This Framework Does

- Gives every new project a consistent starting structure
- Keeps Claude grounded in your design decisions across conversations
- Tracks enhancements, bug fixes, and decisions in one organized place
- Prevents architectural and design drift as apps are built out and enhanced

---

## Right-Sizing the Framework

Not every change needs the full pipeline. Use the right level of effort for the job.

### Quick Fix (bug fix, copy change, minor tweak)
1. Just do it with Claude
2. Update `ai/context.md` when done
3. That's it — no template needed

### Standard Enhancement (a feature, refactor, or meaningful change)
1. Copy `templates/enhancement.md` into `ai/enhancements/NNN-name/plan.md`
2. Fill in scope, approach, and regression check
3. Use `prompts/blueprint-to-todo.md` if the work is complex enough to need a checklist
4. Work through it, update `ai/context.md` and `ai/enhancements/ENHANCEMENTS.md` when done

### Full Application Build (new app from scratch)
1. Follow the complete pipeline below — idea → spec → blueprint → todo
2. Use all prompts in order
3. Every file matters — don't skip steps

### Ideas Not Ready Yet
- Capture in `templates/idea.md` and keep in `ai/enhancements/ideas/`
- Promote to an enhancement when ready

---

## Starting a New App — Full Pipeline

### Step 1 — Copy the project template

In Finder, duplicate `project-template/` and rename it.
Or in Terminal:

```bash
cp -r ~/Documents/Claude/ai-framework/project-template ~/Documents/Claude/my-new-app
```

### Step 2 — Fill in the AI files (in order)

Work through these with Claude before writing any code.

| File | What It Is | How to Create It |
|---|---|---|
| `ai/spec.md` | WHAT the app does | Use `prompts/idea-to-spec.md` |
| `ai/blueprint.md` | HOW it will be built | Use `prompts/spec-to-blueprint.md` |
| `ai/principles.md` | Design rules Claude must always follow | Fill in manually after blueprint |
| `ai/context.md` | Current build state | Start with the template; Claude maintains it |

### Step 3 — Configure Claude

**If using Claude Desktop:**
1. Create a new Project in Claude Desktop named after your app
2. Paste the contents of `ai/principles.md` into the Project Instructions field
3. `principles.md` already contains the session start/end rules — no extra line needed

**If using Claude Code:**
1. Fill in `CLAUDE.md` at the project root — Claude Code reads this automatically
2. `CLAUDE.md` and `ai/principles.md` should stay in sync — same rules, two entry points

### Step 4 — Create your first enhancement

Copy `templates/enhancement.md` into:
`ai/enhancements/001-foundation/plan.md`

Then use `prompts/blueprint-to-todo.md` to generate a task checklist from your blueprint.

---

## Day-to-Day Workflow

### Starting a Claude session

Use the prompt in `prompts/session-start.md`, or paste this:

```
Before we start, please read:
- ai/principles.md — design rules that must not drift
- ai/context.md — current state including active enhancement path
```

Claude will flag any stale docs and confirm the active enhancement plan is still valid
before starting work. In Claude Code, run `/ai:session-start`.

### During a session

Run a checkpoint whenever a natural stopping point is reached — a decision made, an
enhancement status changed, or meaningful work completed. Use `prompts/session-checkpoint.md`.
In Claude Code, run `/ai:session-checkpoint`.

When an enhancement is completed, run an impact scan before closing it out:
- Check all Not Started and In Progress enhancement plan files
- Check all idea files in `ai/enhancements/ideas/`
- Note any scope or assumption changes in the affected files

In Claude Code, run `/ai:enhancement-closeout`.

When picking up a Not Started enhancement to implement, confirm the plan still holds
given everything completed since it was written.

### Ending a Claude session

Use the end-of-session prompt in `prompts/session-start.md`.
In Claude Code, run `/ai:session-end`.
If checkpoints were run during the session, this is just a quick verify — not a full
batch write. Claude confirms `ai/context.md` and `ai/enhancements/ENHANCEMENTS.md`
are current and nothing was missed.

### When an idea surfaces mid-session

1. Capture it in `templates/idea.md` → save to `ai/enhancements/ideas/`
2. Come back to it when the current work is done
3. Promote to a full enhancement when ready

---

## Keeping context.md Lean

`ai/context.md` is read at the start of every session, so every line in it has a recurring
cost. It is a **snapshot, not a log**. The rules — enforced by the session commands, and
stated identically in `CLAUDE.md` and `ai/principles.md`:

- `**Last updated:**` is ONE line: date + one sentence. It is **replaced** each time, never
  appended to, never a nested changelog
- Per-session narrative detail goes in the active enhancement's `plan.md` **Execution Log**.
  context.md points at it rather than retelling it
- `## Recent Sessions` is a rolling list capped at ~3 one-line entries. Adding one drops the oldest
- `## Open Issues` holds unresolved items only — resolved items are **deleted**, not struck through
- `## What's Next` holds open items plus a single launch tracker — completed items are deleted
- Architectural decisions go in the `ai/blueprint.md` changelog, not a table in context.md
- Prefer a pointer to `ENHANCEMENTS.md` / `plan.md` / `blueprint.md` over restating them
- The durable `## Key Facts` reference core (ports, commands, env/OAuth gotchas) holds only what
  nearly every session needs. A gotcha that belongs to one area goes in that area's section of
  `ai/key-facts.md` — never read at session start, read by section before touching the area —
  and the index under `## Key Facts` names the area. Prune only superseded entries

### ai/key-facts.md

Key Facts only grows. Each entry records a failure that cost real time and that the code
doesn't make visible, and the warning outlives the fix, so entries are almost never superseded.
In a mature project this section becomes most of context.md. Pruning would delete the record
that stops the bug coming back, and archiving would hide it where no session looks. Instead,
Key Facts has two tiers:

- **The core**, under `## Key Facts` in context.md: facts a session needs even if it never
  touches their area, such as ports, dev and test commands, toolchain quirks and sync rules.
  It also holds an **index**, a table that maps each area to a section of `ai/key-facts.md`.
  An area is named by the concrete things a session is about to open (packages, directories,
  commands, domain words), not by an abstract category.
- **`ai/key-facts.md`**: every other fact, under a `##` heading per area. It is never read in
  full at session start. `/ai:session-start` reads only the sections the active plan touches,
  and any session reads a section before touching that area.

**The placement test:** *would a session that never touches this area still need this fact?*
If yes, it goes in the core. If no, it goes in `key-facts.md`. When unsure, choose `key-facts.md`:
a misplaced core fact costs one extra section read, while an area fact left in the core costs
every session.

Like the archive, `key-facts.md` is created **lazily**. `/ai:session-end` creates it for the
first fact that belongs to one area. A new area means a new `##` heading **and** a new index
row, in the same edit, because a section with no row can't be reached. The file is outside the
session-start read path, like the archive. The difference is that `key-facts.md` is read by
section, on demand, while the archive is never read.

Rules that must never be broken still go as one-liners in `CLAUDE.md`'s "Never Do These".
`key-facts.md` holds the *why* and the *how*.

### ai/context-archive.md

History that's worth keeping but not worth re-reading every session goes in
`ai/context-archive.md`. It's created **lazily** — a fresh project doesn't have one — and it
is **never in the session-start read list**. The file stays in the repo; it's just out of the
read path.

### Remediating an already-bloated project

Existing projects that grew a bloated context.md can be pared down — opt-in, one time, per
project. In Claude Code, copy `.claude/commands/ai/context-pare-down.md` into the project,
along with the updated `session-start.md` and `session-end.md` so later sessions keep the
two-tier Key Facts. Update the Key Facts bullet in `CLAUDE.md` and `ai/principles.md` to match
the template, then run `/ai:context-pare-down`. It:

1. Copies the current `ai/context.md` **verbatim** into `ai/context-archive.md`
2. **Diff-verifies** the archive against the original — a hard gate; nothing is trimmed until
   the diff is clean
3. Rewrites `context.md` to the lean skeleton, carrying forward only current state and every
   Key Facts entry
4. Splits Key Facts using the placement test. Area facts move **verbatim** into
   `ai/key-facts.md`, and the core stays in context.md with the index. A hard gate verifies that
   every entry appears exactly once across the two files and that every section has an index
   row. Corrections, such as removing superseded entries, come only after that, as a separate,
   reported pass

Nothing is lost. Everything trimmed is in the archive, and every Key Facts entry is in the core
or in `key-facts.md`. Commit `context.md`, `context-archive.md` and `key-facts.md` together in
one commit.

---

## Document Governance

**When does each file change?**

| File | Changes when... | Who updates it |
|---|---|---|
| `spec.md` | A meaningful product requirement changes or is added | You — review carefully, version it |
| `blueprint.md` | An architectural decision is made or changed | Claude at end of session, or you |
| `principles.md` | A new design rule is established or an old one changes | You — then sync `CLAUDE.md` |
| `context.md` | Every session ends — as a lean snapshot, never a growing log | Claude — automatically |
| `key-facts.md` | A gotcha that belongs to one area is learned, or Key Facts is split | Claude — via `/ai:session-end` or `/ai:context-pare-down`; read by section, never at session start |
| `context-archive.md` | Only when history is pared off context.md | Claude — via `/ai:context-pare-down`, never read at session start |
| `enhancements/NNN/plan.md` | Every checkpoint — the Execution Log is where session detail goes | Claude — automatically |
| `enhancements/ENHANCEMENTS.md` | An enhancement starts, completes, or is added | Claude — automatically |
| `changelog.md` | A release or enhancement ships | You — brief entry |

**Spec versioning rule:** when `spec.md` changes significantly, bump the version number and add a changelog entry at the bottom. Don't silently overwrite — future-you needs to know what changed and why.

**Blueprint versioning rule:** same as spec. Small additions are fine inline. Major structural changes get a version bump and changelog entry.

---

## Project Folder Structure

```
my-app/
├── CLAUDE.md                      # Claude Code reads this automatically — keep in sync with principles.md
├── ai/
│   ├── spec.md                    # WHAT the app does — stable, versioned
│   ├── blueprint.md               # HOW it's built — evolves with the app
│   ├── principles.md              # Design rules — Claude always follows these
│   ├── context.md                 # Current state — LEAN SNAPSHOT, Claude maintains this
│   ├── key-facts.md               # Subsystem gotchas — read by section, never at session start
│   ├── context-archive.md         # Frozen history — created lazily, NEVER read at session start
│   └── enhancements/
│       ├── ENHANCEMENTS.md        # Status board (grouped by status) — Claude maintains this
│       ├── status.sh             # Prints the board in the terminal — read-only
│       ├── ideas/                 # Parking lot for ideas not ready to plan
│       │   └── [idea.md files]
│       ├── 001-foundation/
│       │   └── plan.md            # Includes the Execution Log — where session detail lives
│       ├── 002-auth/
│       │   ├── plan.md
│       │   └── decisions.md       # Optional: notable decisions and why
│       └── 003-[feature]/
├── .claude/
│   └── commands/
│       └── ai/                    # Claude Code slash commands — the /ai: namespace
│           ├── session-start.md       # /ai:session-start
│           ├── session-checkpoint.md  # /ai:session-checkpoint
│           ├── enhancement-closeout.md # /ai:enhancement-closeout
│           ├── session-end.md         # /ai:session-end
│           ├── board.md               # /ai:board — prints the enhancement status board
│           └── context-pare-down.md   # /ai:context-pare-down — one-time context.md remediation
├── changelog.md                   # What shipped and when (brief)
└── [source code]
```

---

## Framework Files Reference

```
ai-framework/
├── START-HERE.md                  # This file
├── project-template/              # Copy this for every new app
│   ├── CLAUDE.md                  # Claude Code entry point — fill in after blueprint
│   ├── ai/
│   │   ├── spec.md
│   │   ├── blueprint.md
│   │   ├── principles.md
│   │   ├── context.md             # Lean snapshot skeleton — stays lean by contract
│   │   └── enhancements/
│   │       ├── ENHANCEMENTS.md    # Status board (grouped by status) — Claude maintains this
│   │       ├── status.sh         # Prints the board in the terminal — read-only
│   │       ├── ideas/
│   │       └── 001-foundation/
│   │           └── plan.md
│   ├── .claude/
│   │   └── commands/
│   │       └── ai/                # Claude Code slash commands (/ai: namespace) — copy to each project
│   │           ├── session-start.md
│   │           ├── session-checkpoint.md
│   │           ├── enhancement-closeout.md
│   │           ├── session-end.md
│   │           ├── board.md       # /ai:board — prints the enhancement status board
│   │           └── context-pare-down.md  # /ai:context-pare-down — one-time context.md remediation
│   └── changelog.md
├── templates/
│   ├── enhancement.md             # Standard feature, bug fix, or refactor
│   ├── idea.md                    # Capture ideas not ready to plan yet
│   └── pre-launch-checklist.md   # Verify before any app store or production release
├── prompts/
│   ├── idea-to-spec.md            # Generate spec.md from an idea
│   ├── spec-to-blueprint.md       # Generate blueprint.md from spec.md
│   ├── blueprint-to-todo.md       # Generate a task checklist from blueprint.md
│   ├── session-start.md           # Start and end Claude sessions correctly
│   └── session-checkpoint.md      # Mid-session checkpoint and enhancement close-out impact scan
└── changelog.md                   # Framework-level changes over time
```
