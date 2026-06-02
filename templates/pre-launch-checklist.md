# Pre-Launch Checklist — [App Name] v[X.Y]

**Target release:** [Date]
**Platform:** [iOS / Android / Web / All]

> Use this before every meaningful release — app store submissions, major version launches,
> or any public deployment. Skip sections that don't apply to your app type.

---

## Product

- [ ] All features in this release are complete and manually verified
- [ ] All known blockers are resolved
- [ ] Out-of-scope items are confirmed deferred — nothing accidentally missing
- [ ] App works end-to-end on a real device (not just simulator)
- [ ] Core workflows tested by a fresh user (not just the developer)

---

## Code & Build

- [ ] No console errors or warnings in production build
- [ ] No hardcoded secrets, API keys, or dev URLs in the codebase
- [ ] `.env.example` is up to date with all required variables
- [ ] All dependencies are pinned to stable versions
- [ ] Production build tested locally before submission
- [ ] Git tag created for this release

---

## Data & Backend

- [ ] Database migrations applied to production
- [ ] No test data or seed data in production database
- [ ] API endpoints tested against production environment
- [ ] Error handling verified — graceful failures, no raw stack traces exposed to users
- [ ] Rate limiting confirmed active on sensitive endpoints

---

## Security

- [ ] All secrets are in environment variables — not in code or committed to git
- [ ] HTTPS enforced in production
- [ ] Auth flows tested end-to-end (login, logout, token refresh, session expiry)
- [ ] Protected routes verified — unauthenticated access correctly blocked

---

## Performance

- [ ] App launches in acceptable time on a mid-range device
- [ ] Key actions complete within acceptable time under normal conditions
- [ ] No obvious memory leaks or runaway processes

---

## App Store (iOS / Android)

- [ ] App icon provided in all required sizes
- [ ] Screenshots prepared for all required device sizes
- [ ] App name, subtitle, and description reviewed and finalized
- [ ] Privacy policy URL live and accessible
- [ ] App Store / Play Store listing reviewed for accuracy
- [ ] Age rating confirmed correct
- [ ] In-app purchases (if any) tested in sandbox environment
- [ ] Push notification permissions handled gracefully if used
- [ ] Deep links tested if used
- [ ] TestFlight / internal testing completed before public submission

---

## Web (if applicable)

- [ ] Deployed to production environment successfully
- [ ] Domain and SSL certificate confirmed working
- [ ] 404 and error pages in place
- [ ] Analytics confirmed tracking if used

---

## Monitoring & Support

- [ ] Error tracking (e.g., Sentry) active in production
- [ ] Uptime monitoring configured
- [ ] You know how to roll back if something goes wrong

---

## Post-Launch

- [ ] changelog.md updated with this release
- [ ] context.md updated to reflect new current state
- [ ] Any known issues or follow-up items captured in context.md under "What's Next"
