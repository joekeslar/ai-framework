# [App Name] — Technical Blueprint
**Version 1.0**

> **How to use this file:**
> This document defines HOW the app is built. It evolves as architecture decisions are made.
> When major architectural changes occur, update this document and note the change in the changelog below.
> This file should give Claude enough context to make implementation decisions that are consistent with the existing system.

---

## 1. Technology Stack

| Component | Choice | Notes |
|---|---|---|
| Platform | [e.g., React Native / Expo, React web app, Next.js] | Determined during spec |
| Framework | [e.g., Expo SDK 52, Next.js 14, Vite + React] | |
| Navigation | [e.g., React Navigation, Next.js routing, React Router] | |
| Backend | [e.g., Node.js / Express, Supabase, Firebase, none] | |
| Database | [e.g., PostgreSQL, SQLite, AsyncStorage, Supabase] | |
| Auth | [e.g., JWT, Supabase Auth, NextAuth, none] | |
| LLM Integration | [e.g., Anthropic Claude API, OpenAI, none] | |
| State Management | [e.g., React Context, Zustand, none] | |
| Styling | [e.g., Tailwind, StyleSheet, NativeWind] | |
| Cloud / Hosting | [e.g., AWS, Vercel, Supabase, none] | |

---

## 2. High-Level Architecture

[Describe how the pieces connect. Include a diagram if helpful.]

```
[User / Browser / Device]
     │
     ▼
[Frontend — web or mobile]
     │
     ▼
[Backend API / Cloud Service]
     │
     ▼
[Database]
```

---

## 3. Project Folder Structure

```
my-app/
├── frontend/          # or src/ for single-tier apps
│   ├── [entry point]
│   └── src/
│       ├── screens/   # or pages/ for web
│       ├── components/
│       ├── navigation/ # or routing/
│       ├── hooks/
│       ├── api/
│       └── theme/
├── backend/           # if applicable
│   └── src/
│       ├── routes/
│       ├── services/
│       ├── models/
│       └── middleware/
└── [other dirs]
```

---

## 4. Navigation / Routing Structure

[Describe how users move through the app. Format depends on the platform.]

- For mobile apps: list stacks and tabs with their screens
- For web apps: list routes and page hierarchy
- For server-rendered apps: list pages and any nested layouts

| Route / Stack | Screens / Pages | Notes |
|---|---|---|
| [e.g., Auth flow] | [Login, Register, Reset password] | |
| [e.g., Main tabs] | [Home, Search, Profile] | |
| [e.g., /dashboard] | [Dashboard page] | Protected route |

---

## 5. Data Model

[Describe key data structures — database tables, AsyncStorage keys, or API shapes.]

### [Entity Name]

| Field | Type | Notes |
|---|---|---|
| id | UUID | Primary key |
| [field] | [type] | |

---

## 6. API Design

[List key endpoints or service calls if applicable.]

| Method | Path | Purpose |
|---|---|---|
| GET | /api/[resource] | |
| POST | /api/[resource] | |

---

## 7. Third-Party Integrations

[List any external services the app depends on.]

| Service | Purpose | Notes |
|---|---|---|
| [e.g., Stripe] | [e.g., Payments] | |
| [e.g., Resend] | [e.g., Transactional email] | |
| [e.g., Anthropic API] | [e.g., LLM analysis] | |

---

## 8. LLM Integration

[If the app uses an LLM, describe how it's integrated.]

- Provider: [Anthropic / OpenAI / on-device]
- Invocation: [client-side / backend service layer]
- Prompt strategy: [describe approach]
- Response format: [JSON / text]
- Error handling: [retry logic, fallback behavior]

---

## 9. Testing Approach

> Focus on critical paths first. Broaden coverage over time as the app matures.

**Critical paths to test** (flows where failure is most costly):
- [e.g., User authentication — login, logout, token refresh]
- [e.g., Data writes — entries saved correctly and completely]
- [e.g., Payment flow — charge only occurs on confirmed success]

**Testing strategy:**
- [ ] Manual verification after each build phase (covered by todo checklists)
- [ ] Automated tests for critical paths listed above
- [ ] Broaden coverage later for high-churn or fragile areas

---

## 10. Security Considerations

| Concern | Approach |
|---|---|
| Auth & sessions | [e.g., JWT with short expiry + refresh token rotation] |
| Input validation | [e.g., Validate and sanitize all inputs server-side] |
| Rate limiting | [e.g., 100 requests/min per IP on auth endpoints] |
| Secrets management | [e.g., All secrets in .env, never committed to git] |
| Data protection | [e.g., HTTPS enforced, passwords hashed with bcrypt] |
| API security | [e.g., All routes protected except /login and /register] |

---

## 11. Operational Concerns

| Concern | Approach |
|---|---|
| Logging | [e.g., Server errors logged with timestamp and stack trace] |
| Error tracking | [e.g., Sentry for runtime errors in production] |
| Monitoring | [e.g., Uptime check via UptimeRobot, no custom metrics yet] |
| Local dev setup | [e.g., Copy .env.example to .env, run npm install, npm run dev] |

---

## 12. Design System

### Colors

| Role | Color | Hex |
|---|---|---|
| Primary | [Name] | `#000000` |
| Background | [Name] | `#000000` |
| Text | [Name] | `#000000` |
| Accent | [Name] | `#000000` |

### Typography

| Role | Font | Notes |
|---|---|---|
| Headings | [Font] | |
| Body / UI | [Font] | |

---

## 13. Key Technical Decisions

> Record significant decisions here so Claude understands WHY things are built a certain way.
> For each decision: what was chosen, what was rejected, and why.

| Decision | Chosen | Rejected | Rationale |
|---|---|---|---|
| [e.g., Auth approach] | [JWT] | [Sessions, Magic link] | [Reason] |
| [e.g., Backend] | [Supabase] | [Custom Node.js] | [Reason] |

---

## 14. Changelog

| Version | Date | Summary |
|---|---|---|
| 1.0 | [Date] | Initial blueprint |
