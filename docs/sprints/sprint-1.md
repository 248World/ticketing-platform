# Sprint 1 review and retrospective

Goal: a running skeleton works end to end locally and in CI.
Result: achieved.

## Done
- TKT-9 Repository skeleton and CI, with branch protection
- TKT-10 Requirements v0.1
- TKT-11 PostgreSQL in Docker Compose
- TKT-13 Scope, currency and payment decisions (ADR-0001, ADR-0002)
- TKT-14 Spring Boot backend skeleton (ADR-0003)
- TKT-15 Flyway migration and stations endpoint
- TKT-16 CI builds and tests the backend, required check
- TKT-17 Flutter skeleton and CORS policy (ADR-0004)

## Demonstrated
Station list loaded from PostgreSQL through the API into a Flutter screen in
Chrome, with loading, empty and error states, and CI blocking merges on failure.

## Not done or known limitations
- Flutter analyze and tests are not in CI yet.
- Android toolchain not set up (cmdline-tools, licenses).
- No simulated stations or schedules yet.
- Payment provider access (MTN, Orange, Stripe) is unconfirmed.
- Working assumption: one developer, no fixed deadline. To be confirmed.

## Retrospective
What went well:
- (write 2 items)

What caused delay or mistakes:
- (write 2 items)

What I will change in Sprint 2:
- (write 2 concrete actions)