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

## Document Governance

**When does each file change?**

| File | Changes when... | Who updates it |
|---|---|---|
| `spec.md` | A meaningful product requirement changes or is added | You — review carefully, version it |
| `blueprint.md` | An architectural decision is made or changed | Claude at end of session, or you |
| `principles.md` | A new design rule is established or an old one changes | You — then sync `CLAUDE.md` |
| `context.md` | Every session ends | Claude — automatically |
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
│   ├── context.md                 # Current state — Claude maintains this
│   └── enhancements/
│       ├── ENHANCEMENTS.md        # Status board (grouped by status) — Claude maintains this
│       ├── status.sh             # Prints the board in the terminal — read-only
│       ├── ideas/                 # Parking lot for ideas not ready to plan
│       │   └── [idea.md files]
│       ├── 001-foundation/
│       │   └── plan.md
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
│           └── board.md               # /ai:board — prints the enhancement status board
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
│   │   ├── context.md
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
│   │           └── board.md       # /ai:board — prints the enhancement status board
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
