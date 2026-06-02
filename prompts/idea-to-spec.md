# Prompt: Idea → Spec

Use this prompt to turn an app idea into a structured `spec.md`.
Run this in a Claude Desktop session before writing any code.

---

## Step 1 — Discovery Interview

Paste this prompt with your idea appended at the bottom:

```
I want to build an application. Ask me one question at a time to help develop a thorough
product specification. Each question should build on my previous answers. Our goal is a
detailed spec I can hand off for development.

Work through these areas:
- What problem does the app solve? Who has this problem and why does it matter to them?
- User personas:
  - Who is the primary user? Describe them specifically — what are they doing today
    instead of using this app?
  - Are there secondary users or admins with different needs?
- What are the core workflows (step by step)?
- What are the key features?
- Success metrics:
  - How will you know if this app is working?
  - What does success look like at 1 month and 6 months?
- MVP definition:
  - What is the absolute minimum version that delivers real value?
  - What can be cut and still have something worth using?
- What are the constraints (scale, privacy, auth, monetization)?
- Access, data, and distribution:
  - Does it need to work offline or with intermittent connectivity?
  - Does data live on the device, in the cloud, or both? Any sync requirements?
  - Does it need real-time updates (live data, multi-user, push notifications)?
  - How will users get the app — web browser, app store, desktop, internal tool?
- Error handling and edge cases:
  - What should happen when an external service or API call fails?
  - Are there any invalid or unexpected inputs the app must handle gracefully?
  - Are there any critical flows where failure is especially costly (payments, data loss, auth)?
- What is explicitly out of scope?

Ask one question at a time. Dig into details. Push back if an answer is vague.
Don't move to the next area until the current one is clear.

Here's my idea:

[Paste your idea here]
```

---

## Step 2 — Generate spec.md

Once the interview is complete, paste this prompt:

```
I am a solo developer. Now that we've covered the details, compile everything into a
structured spec.md file.

First, read the spec.md template at:
ai-framework/project-template/ai/spec.md

Then generate a completed spec.md following that exact structure and section order.

Rules:
- Write from the user's perspective — no frameworks, infrastructure, or implementation details
- Be specific and concrete — vague requirements cause implementation drift
- Keep scope appropriate for a solo developer — don't over-engineer requirements
- Flag anything that needs a decision with [DECISION NEEDED]
```

---

## Tips

- Keep scope tight. It's easier to add features than remove them.
- If you're unsure about something, use [DECISION NEEDED] — don't guess.
- Review the spec carefully before moving to blueprint. Fix it now, not later.
