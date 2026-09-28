---
description: One-time remediation — archive a bloated ai/context.md verbatim, rewrite it lean, and split Key Facts into ai/key-facts.md
---

`ai/context.md` has grown into a log instead of a snapshot. Pare it down.

**This is a one-time, opt-in remediation. Nothing may be lost: the full current file is
archived VERBATIM and diff-verified BEFORE a single line is trimmed, and every Key Facts entry
is moved verbatim and diff-verified BEFORE any of them is corrected.** Work through these
steps in order and stop at the first failed check.

---

## Step 0 — Preflight

```bash
wc -c ai/context.md; wc -l ai/context.md
git status --porcelain ai/
ls -la ai/context-archive.md 2>/dev/null || echo "no archive yet"
ls -la ai/key-facts.md 2>/dev/null || echo "no key-facts yet"
```

- If `ai/context.md` has uncommitted changes, ask me to commit first — git then holds an
  independent second copy of the original.
- Report the current size and line count. That's the "before" number.

---

## Step 1 — Take a scratch original

```bash
cp ai/context.md /tmp/context-original.md
if [ -f ai/key-facts.md ]; then cp ai/key-facts.md /tmp/key-facts-original.md
else rm -f /tmp/key-facts-original.md; fi
```

These are the comparison baselines for every check below. Do not edit them.

---

## Step 2 — Archive VERBATIM

**If `ai/context-archive.md` does NOT exist**, create it with this exact shape — a short
header, then the original content byte-for-byte, unmodified:

```
# [App Name] — Context Archive

> Frozen history pared off `ai/context.md`. Nothing here is read at session start —
> `/ai:session-start` reads `ai/context.md` only. Consult this file only when you
> specifically need history.
<!-- ARCHIVE HEADER END -->

<!-- ARCHIVED [Date] START -->
[the entire previous contents of ai/context.md, verbatim — first line immediately after the
START marker, last line immediately before the END marker]
<!-- ARCHIVED [Date] END -->
```

**If `ai/context-archive.md` already exists**, leave everything in it untouched and append a
new `<!-- ARCHIVED [Date] START -->` … `<!-- ARCHIVED [Date] END -->` block at the end.

Rules for this step:
- Copy, do not summarize, paraphrase, reformat, or re-wrap. Byte-for-byte.
- Do not fix typos, headings, or markdown along the way.

---

## Step 3 — Verify the archive (HARD GATE)

Extract the block you just wrote and diff it against the untouched original:

```bash
awk '/<!-- ARCHIVED .* START -->/{f=1;next} /<!-- ARCHIVED .* END -->/{f=0} f' \
  ai/context-archive.md | tail -n "$(wc -l < /tmp/context-original.md)" \
  | diff - /tmp/context-original.md && echo "ARCHIVE VERIFIED — identical"
```

- If this prints anything other than `ARCHIVE VERIFIED — identical`, **STOP**. Do not touch
  `ai/context.md`. Fix the archive and re-run the check.
- Also sanity-check the sizes:

```bash
wc -l /tmp/context-original.md ai/context-archive.md
```

The archive must be at least as long as the original. Only proceed past this line once the
diff is clean.

---

## Step 4 — Rewrite ai/context.md to the lean skeleton

Replace the whole file with this skeleton, carrying forward **only current truth**:

```
# [App Name] — Current Context
**Last updated:** [today] — pared down to a lean snapshot; history archived in ai/context-archive.md

> [the "How to maintain this file" blockquote from the framework's context.md template]

## Current State          — build phase, overall status, active enhancement path
## Recent Sessions        — at most the 3 most recent, one line each → link to its plan.md
## What's Working         — stable areas, one line each, no history
## Open Issues            — UNRESOLVED only
## What's Next            — open items + a single launch tracker
## Key Facts [the AI] Should Know  — every entry, verbatim, for now; Step 4b splits it
## Pointers               — board, active plan.md, blueprint, principles, spec, key-facts, archive
```

What carries forward:
- **`## Key Facts` — carry forward in full, verbatim.** It ends up in full across `context.md`
  and `ai/key-facts.md` — Step 4b does that split. Do not thin, reword, or prune any entry in
  this step, not even a superseded one: corrections come only after the split is verified.
- Current state, still-stable features, still-open issues, still-open next steps.

What is dropped (it is safe in the archive):
- Every past-session narrative, changelog entry, and nested "Last updated" history
- Resolved / struck-through issues
- The `Recent Decisions` table — architectural decisions belong in the `ai/blueprint.md`
  changelog. Before dropping the table, check each row is represented in blueprint.md; if one
  isn't, add it there first.
- Any `Enhancement Roadmap` section — it duplicates `ai/enhancements/ENHANCEMENTS.md`. Confirm
  every open item on it exists on the board, then drop it and point at the board instead.
- Recent Sessions entries beyond the newest ~3

Rewrite it as prose someone reads cold in 30 seconds. When in doubt, cut — the archive has it.

---

## Step 4b — Split Key Facts

Key Facts is never thinned to save space. Every entry is still current until the code
supersedes it. What changes is **where** each entry lives: in the core, read every session, or
in `ai/key-facts.md`, read by section only when a session is about to touch that area.

**Sort each Key Facts entry with the placement test:** *would a session that never touches this
area still need this fact?*
- Yes → it stays in the core (`## Key Facts` in context.md): ports, dev and test commands,
  environment and toolchain quirks, sync rules.
- No → it moves to `ai/key-facts.md`, under a `##` heading for its area.
- Unsure → `ai/key-facts.md`. A core fact placed there by mistake costs one extra section read,
  when it's needed. An area fact left in the core costs every session.

If every entry belongs in the core, don't create an empty `ai/key-facts.md`. Replace the Key
Facts note with the one shown below, leave out the index, and go to Step 5.

Move the area entries **verbatim** — including any indented continuation lines. Do not reword,
merge, or fix anything yet. If `ai/key-facts.md` exists, append to its matching sections, or add
new ones. If it doesn't, create it with this shape:

```
# [App Name] — Key Facts

> Subsystem gotchas, kept out of `ai/context.md` so every session doesn't pay for them.
> **Not read at session start.** Before touching an area, read its section — the index under
> `## Key Facts` in context.md maps areas to sections. Only what isn't obvious from the code;
> prune only entries the code has superseded. A fact nearly every session needs goes in
> context.md instead.

---

## [Area]

- [entry, moved verbatim]
```

Then rework context.md's `## Key Facts` into this shape: the note, the core entries (still
verbatim), and an index with one row per `##` section of `ai/key-facts.md`. Name each area by
the concrete things a session is about to open (packages, directories, commands, domain words),
not by an abstract category:

```
> What nearly every session needs. Subsystem gotchas live in [`ai/key-facts.md`](key-facts.md),
> which is **not** read at session start — before touching an area in the index below, read its
> section. A new fact goes there unless nearly every session needs it; prune only superseded entries.

- [core entries, verbatim]

**Before you touch an area, read its section of [`key-facts.md`](key-facts.md):**

| Area | Section |
|---|---|
| `backend/`, migrations, `npm run db:*`, any SQL | [Database](key-facts.md#database) |
```

Add to `## Pointers`:
`- **Subsystem gotchas:** [`ai/key-facts.md`](key-facts.md) — read by section, never at session start`

**Verify (HARD GATE, like Step 3).** Every entry line from before, including the old
`ai/key-facts.md` if there was one, must now appear exactly once across the two files:

```bash
ENTRY='^(- |[[:space:]]+[^[:space:]])'   # a bullet, or an indented continuation line
{ awk '/^## /{f=/^## Key Facts/} f' /tmp/context-original.md | grep -E "$ENTRY"
  [ -f /tmp/key-facts-original.md ] && grep -E "$ENTRY" /tmp/key-facts-original.md
} | sort > /tmp/kf-before
{ awk '/^## /{f=/^## Key Facts/} f' ai/context.md | grep -E "$ENTRY"
  grep -E "$ENTRY" ai/key-facts.md
} | sort > /tmp/kf-after
diff /tmp/kf-before /tmp/kf-after && echo "KEY FACTS SPLIT VERIFIED — nothing lost, nothing doubled"

missing=$(grep '^## ' ai/key-facts.md | sed 's/^## //' | while read -r h; do
  grep -qF "[$h]" ai/context.md || echo "$h"; done)
[ -z "$missing" ] && echo "EVERY SECTION INDEXED" || { echo "NO INDEX ROW FOR:"; echo "$missing"; }
```

- If the first check prints anything other than `KEY FACTS SPLIT VERIFIED`, **STOP**. An entry
  was lost, doubled, or altered in the move. Fix the move and re-run.
- If the second prints `NO INDEX ROW FOR:`, those sections are unreachable. Add their rows and
  re-run.

**Only after both checks are clean**, make corrections as a separate pass: remove an entry the
code has superseded, fix a superseded detail, or split an entry that holds two unrelated facts.
Note each correction for the report. Re-running the first check afterwards should show exactly
those lines and nothing else.

---

## Step 5 — Final verification and report

```bash
diff /tmp/context-original.md ai/context.md | head -5   # expected: large diff — it was rewritten
awk '/<!-- ARCHIVED .* START -->/{f=1;next} /<!-- ARCHIVED .* END -->/{f=0} f' \
  ai/context-archive.md | tail -n "$(wc -l < /tmp/context-original.md)" \
  | diff -q - /tmp/context-original.md && echo "ARCHIVE STILL INTACT"
wc -c /tmp/context-original.md ai/context.md ai/key-facts.md 2>/dev/null
wc -l /tmp/context-original.md ai/context.md ai/context-archive.md
```

Report to me:
- context.md: before → after size (bytes) and line count
- Confirmation the archive still diffs clean against the original
- What was dropped, by category (sessions, resolved issues, decisions table, roadmap)
- Anything moved into `blueprint.md` or `ENHANCEMENTS.md` instead of being dropped
- Key Facts: how many entries stayed in the core, how many moved to `ai/key-facts.md`, and the
  sections created
- Each correction made after the split verified (superseded entries removed, details fixed,
  compound entries split) and why

Then ask me to review `context.md`, `context-archive.md` and `key-facts.md` and commit them
**together in one commit**, so the archive, the pared-down context and the split land
atomically. Leave the `/tmp` baselines in place until I've confirmed.
