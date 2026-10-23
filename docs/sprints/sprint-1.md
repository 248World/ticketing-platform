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
- Proving that checks can fail, not only pass. CI went red on purpose for the
  workflow (TKT-9) and for a broken test (TKT-16), then green again. The same
  habit worked locally for the Flutter and station tests.
- Branch protection was verified, not assumed: a direct push to main was
  rejected by the ruleset.
- Reading official sources and logs instead of guessing. The PostgreSQL 18 image
  refused to start with the old volume path, and its own error message gave the
  fix. The browser console showed the exact CORS error before the fix.
- Small commits and one pull request per story kept the history readable.
- Integration tests run against a real PostgreSQL (Testcontainers), locally and
  in CI.

What caused delay or mistakes:
- Commands run from the wrong folder. A stray backend folder was created outside
  the repository, and docs paths failed when run from inside backend.
- Whole-file edits that dropped content: a pom.xml pasted without the original
  dependencies, and a CI file left with merge-conflict markers after a failed
  git revert.
- Branch and file state got out of sync: work done on main instead of the story
  branch, an empty migration file, a README section that was never saved, and a
  missing .env.example that CI caught.
- Multi-line commands pasted into PowerShell sometimes ran together.

What I will change in Sprint 2:
- Run `git branch --show-current` and check the folder before every commit.
- Run `git diff` before committing, and after replacing a whole file, to confirm
  nothing was lost.
- Check `git status` before any `git revert`, and paste commands one at a time.
- After creating or editing a file, confirm it saved (for example with
  `Get-Content` or the file size) before moving on.