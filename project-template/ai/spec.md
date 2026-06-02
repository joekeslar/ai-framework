# [App Name] — Product Specification
**Version 1.0**

> **How to use this file:**
> This document defines WHAT the app does. It should remain stable as the app grows.
> When major new capabilities are added, version and changelog this document — don't silently overwrite it.
> Do NOT include frameworks, infrastructure, or implementation details here. Those belong in blueprint.md.

---

## 1. App Overview

[1–3 sentences. What is this app? Who is it for? What core problem does it solve?]

---

## 2. User Personas

**Primary user:** [Who is this person specifically? What are they doing today instead of using this app?]

**Secondary users:** [Any other user types with different needs — or "none"]

**Admin / operator:** [Who manages the system — or "none"]

---

## 3. Goals & Constraints

### 3.1 Goals
- [Primary goal]
- [Secondary goal]

### 3.2 Key Constraints

| Constraint | Detail |
|---|---|
| Platform | [e.g., iOS and Android, web, or both — determined during spec] |
| [Other constraint] | [Detail] |

---

## 4. Success Metrics

> How will you know if this app is working? Define measurable outcomes, not just features.

| Timeframe | Metric | Target |
|---|---|---|
| 1 month | [e.g., Active users, key action completed] | [Target] |
| 6 months | [e.g., Retention, revenue, engagement] | [Target] |

**MVP definition:** [What is the absolute minimum version that delivers real value?
What can be cut and still have something worth shipping?]

---

## 5. Core User Workflows

> Describe the main things a user does in the app, step by step.
> Focus on the user experience, not implementation.

### Workflow 1 — [Name]

1. User opens the app
2. ...

### Workflow 2 — [Name]

1. ...

---

## 6. Feature Requirements

### 6.1 [Feature Area]

- [Requirement]
- [Requirement]

### 6.2 [Feature Area]

- [Requirement]

---

## 7. Non-Functional Requirements

| Requirement | Detail |
|---|---|
| Performance | [e.g., key actions complete within 2 seconds] |
| Connectivity | [e.g., requires internet connection / works offline / intermittent connection tolerated] |
| Data residency | [e.g., cloud only / local only / both with sync] |
| Real-time | [e.g., no real-time needs / live updates required / push notifications] |
| Distribution | [e.g., iOS and Android app stores / web browser / desktop / internal] |
| Privacy | [e.g., no user data sent to third parties without consent] |
| Auth | [e.g., no login required for MVP / email + password / SSO] |

---

## 8. Error Handling & Edge Cases

> What the app must handle gracefully. Focus on user-facing behavior, not implementation.

- **External service failure:** [e.g., "If the AI analysis fails, show an error and allow retry — don't silently drop the entry"]
- **Invalid input:** [e.g., "Form fields validate on submit; show inline errors"]
- **Critical flows:** [e.g., "Payment failures must never result in a charge without confirmation"]
- [Any other edge cases identified during spec]

---

## 9. Out of Scope (for this version)

- [Feature excluded and why]
- [Feature deferred to a future phase]

---

## 10. Changelog

| Version | Date | Summary |
|---|---|---|
| 1.0 | [Date] | Initial specification |
