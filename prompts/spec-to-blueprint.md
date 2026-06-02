# Prompt: Spec → Blueprint

Use this prompt to turn a completed `spec.md` into a technical `blueprint.md`.
Attach or paste `spec.md` when running this prompt.

---

## The Prompt

```
I am a solo developer building an application. I use Claude Desktop and Claude Code
as my AI development tools.

Using the attached spec.md, recommend and document a technical blueprint (blueprint.md).
Let the platform and stack emerge from the spec requirements — don't assume mobile or web.

Cover these sections:

1. Technology Stack
   - Platform recommendation (web, mobile, or both) with rationale based on the spec
   - Framework choice (e.g., Next.js, React Native / Expo, Vite + React)
   - Navigation / routing approach appropriate to the platform
   - Backend approach (e.g., Supabase, Node.js/Express, or none) with rationale
   - Database choice and rationale
   - Auth approach
   - Third-party integrations (payments, email/notifications, analytics, maps, social auth, etc.)
   - LLM integration if applicable — recommend client-side vs backend service layer
   - State management
   - Key libraries

2. High-Level Architecture
   - How the pieces connect
   - ASCII diagram if helpful

3. Project Folder Structure
   - Logical layout appropriate to the chosen stack

4. Navigation / Routing Structure
   - Screen or page hierarchy appropriate to the platform (stacks/tabs for mobile, routes/pages for web)

5. Data Model
   - Key tables or data structures with fields and types

6. API Design (if applicable)
   - Key endpoints

7. Third-Party Integrations
   - List all external services and their purpose

8. LLM Integration (if applicable)
   - Provider, invocation pattern, prompt strategy, response format, error handling

9. Testing Approach
   - Identify critical paths (auth, data writes, payments, any flow where failure is costly)
   - Recommend a minimal automated test strategy covering those paths only
   - Note areas to broaden coverage later as the app matures

10. Security Considerations
   - Auth and session security
   - Input validation and sanitization strategy
   - Rate limiting approach
   - Secrets management (env vars, never hardcoded)
   - Any data protection requirements (encryption at rest, in transit)
   - API security (HTTPS enforcement, CORS, public vs protected endpoints)

11. Operational Concerns
   - Logging strategy (what to log, where logs go)
   - Error tracking (e.g., Sentry or equivalent)
   - Monitoring approach (uptime, key metrics)
   - Local development setup (how to run the app from a fresh clone)

12. Design System
   - Suggest a starting color palette and typography appropriate to the app's purpose
   - Keep it simple: 4–6 colors, 2 fonts max
   - Note: the developer will review and finalize these choices before implementation

13. Key Technical Decisions
   - For each significant decision: what was chosen, what was rejected, and why
   - Format: Decision | Chosen | Rejected alternatives | Rationale

Rules:
- Prefer simple, proven patterns over clever abstractions
- No orphaned code — every piece connects to something
- Incremental — each build phase leaves the app runnable
- Consistency over novelty — one pattern per concern
- Validate that the architecture enables every requirement in the spec — flag any gaps
- Flag decisions that need my input with [DECISION NEEDED]

Attached: spec.md
```

---

## After Generating

1. Review the platform and stack recommendation — make sure you agree
2. Resolve all [DECISION NEEDED] items before moving on
3. Fill in the design system with your actual color/font choices
4. Save as `ai/blueprint.md` in your project
5. Update `ai/principles.md` and `CLAUDE.md` with the confirmed stack and architecture rules
