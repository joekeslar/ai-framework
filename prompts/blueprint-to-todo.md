# Prompt: Blueprint → Todo Checklist

Use this prompt to turn a blueprint or enhancement plan into a concrete task checklist.
Works for both the initial build and individual enhancements.
Attach or paste the relevant file when running this prompt.

---

## The Prompt

```
Generate a detailed task checklist from the attached blueprint / enhancement plan.

Requirements:
- Break work into numbered phases (Phase 1, Phase 2, etc.)
- Phase 1 must always begin with environment setup: installing dependencies, configuring
  .env files, and any infrastructure or tooling needed before writing features
- Each phase must end in a fully runnable, testable app state — no half-built features
- Tasks should be atomic — one clear action per checkbox
- Specify file paths in tasks wherever applicable (e.g., "Create src/services/auth.js"
  not "Create the auth service")
- Order tasks by dependency — nothing should require something that hasn't been built yet
- Group related tasks within each phase
- Include automated test tasks for any critical paths identified in the blueprint's
  Testing Approach section
- Include a short verification section at the end of each phase (things to manually test)

Format:
- GitHub-flavored markdown checkboxes: - [ ] Task
- Phase headers as: ### Phase N — Name
- Mark high-complexity or high-risk tasks with ⚠️ so the developer knows to slow down
- Verification steps as: **Verify:** [what to check]

Rules:
- No speculative tasks — only what the blueprint actually calls for
- No large complexity jumps between phases
- Infrastructure and config before features
- Verification after each meaningful piece

Attached: [blueprint.md or enhancement plan.md]
```

---

## Tips

- For large enhancements, run this against just the enhancement plan, not the full blueprint
- Paste the generated checklist into your enhancement's `plan.md`
- Check off tasks as you go — it helps Claude understand what's done when you resume a session
