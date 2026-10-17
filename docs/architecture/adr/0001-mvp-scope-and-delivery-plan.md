# ADR-0001: MVP scope and delivery plan

Status: Accepted (2026-10-17)

## Context
The project is built by one student (to be confirmed) with limited time and an
unknown deadline. The master prompt describes a ten-phase product. Finishing all
of it well is unlikely, so scope must be chosen deliberately.

## Decision
1. The MVP showpiece is: search a journey, hold a seat, book it, pay through a
   simulated provider, and receive a ticket. No seat is sold twice, and no ticket
   exists without verified payment (FR-022, FR-023, FR-032, FR-041, FR-042, FR-043).
2. Postponed unless time remains: account recovery, notifications, admin UI
   (only a few secured endpoints), localization, refunds beyond a simple rule.
3. Build a walking skeleton first (Spring Boot health endpoint, Flyway migration,
   one database read, CI build, one Flutter screen calling the API).
4. Write design documents just in time for each slice, not all up front.
5. Build the Flutter screens and run them in Chrome first. Android toolchain later.
6. Keep documents proportional: short ADRs, and one-page test and risk notes
   until the system exists.

## Consequences
- Less feature breadth, more proof of correctness (automated tests for the
  hardest rules).
- The Liberia context (mobile money first, weak connections, hold-then-pay)
  is treated as a hypothesis to validate with real users, not a fact.
- Unchanged: modular monolith, PostgreSQL with Flyway, server-side authority,
  integer money, small slices with tests.

## Order of work
1. Walking skeleton
2. Stations, simulated schedules, search API
3. Seat holds and concurrency tests
4. Booking state machine and idempotency
5. Simulated payment, webhooks, ticket issuance
6. Thin Flutter app over the backend
7. Everything else, as time allows