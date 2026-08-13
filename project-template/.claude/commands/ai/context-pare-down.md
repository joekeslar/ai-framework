---
description: One-time remediation — archive a bloated ai/context.md verbatim, then rewrite it lean
---

`ai/context.md` has grown into a log instead of a snapshot. Pare it down.

**This is a one-time, opt-in remediation. Nothing may be lost: the full current file is
archived VERBATIM and diff-verified BEFORE a single line is trimmed.** Work through these
steps in order and stop at the first failed check.

---

## Step 0 — Preflight

```bash
wc -l ai/context.md
git status --porcelain ai/
ls -la ai/context-archive.md 2>/dev/null || echo "no archive yet"
```

- If `ai/context.md` has uncommitted changes, ask me to commit first — git then holds an
  independent second copy of the original.
- Report the current line count. That's the "before" number.

---

## Step 1 — Take a scratch original

```bash
cp ai/context.md /tmp/context-original.md
```

This is the comparison baseline for every check below. Do not edit it.

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
## Key Facts [the AI] Should Know
## Pointers               — board, active plan.md, blueprint, principles, spec, archive
```

What carries forward:
- **`## Key Facts` — carry forward in full.** This is the durable reference core (ports,
  migration commands, env/OAuth gotchas). Do not thin it out to save space; drop an entry only
  if the code has actually superseded it.
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

## Step 5 — Final verification and report

```bash
diff /tmp/context-original.md ai/context.md | head -5   # expected: large diff — it was rewritten
awk '/<!-- ARCHIVED .* START -->/{f=1;next} /<!-- ARCHIVED .* END -->/{f=0} f' \
  ai/context-archive.md | tail -n "$(wc -l < /tmp/context-original.md)" \
  | diff -q - /tmp/context-original.md && echo "ARCHIVE STILL INTACT"
wc -l /tmp/context-original.md ai/context.md ai/context-archive.md
```

Report to me:
- context.md: before → after line count
- Confirmation the archive still diffs clean against the original
- What was dropped, by category (sessions, resolved issues, decisions table, roadmap)
- Anything moved into `blueprint.md` or `ENHANCEMENTS.md` instead of being dropped
- Any Key Facts entry you removed and why

Then ask me to review both files and commit them **together in one commit**, so the archive
and the pared-down context land atomically. Leave `/tmp/context-original.md` in place until
I've confirmed.
