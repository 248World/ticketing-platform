# Requirements: Train and Bus Ticketing Platform (v0.1)

Status: draft. Business policies marked TBC need confirmation.

## 1. Problem statement

Students and daily commuters who buy bus and train tickets often face outdated schedules, unclear seat availability, and payments that don’t confirm whether a ticket was issued. This project is a mobile app where a traveler can search journeys, see which seats are actually free, pay, and receive a ticket that is only issued once payment is verified, with all bookings kept in one place. The first version works against a simulated transport provider and sandbox payments, so its tickets are not valid with any real operator.

## 2. MVP scope

A registered traveler can search simulated train and bus journeys, hold
seats, enter passenger details, pay through a payment sandbox, and receive
a ticket with a verifiable identifier. They can see it under My Trips and
cancel it under a stated rule.

### Excluded from the MVP
- Real operator integrations and real money
- Guest checkout (guests can search only)
- Loyalty, promo codes, multi-leg itineraries, round trips
- Push notifications
- Full admin web UI
- Multi-currency and full localization
- Seat maps for operators without seat data

## 3. Assumptions

- A1. The first operator is simulated and labeled as such everywhere.
- A2. Service area is Liberia. Default currency is LRD; USD is also supported. Each fare has a single currency, with no automatic conversion in the MVP. Amounts are stored as integer minor units with an ISO 4217 currency code.
- A3. Small team, two-week sprints.
- A4. Android first for mobile testing.
- A5. Stack is a proposal until an ADR confirms it.
- A6. Times are stored in UTC with the station time zone and shown in local station time.

## 4. Functional requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-001 | A user can register with email and password. | Must |
| FR-002 | A registered user can log in and log out. | Must |
| FR-003 | A user can view and edit their profile. | Should |
| FR-004 | A user can recover access to their account. | Should |
| FR-010 | Any user can search journeys by origin, destination, date, passenger count, and transport type. | Must |
| FR-011 | Results show departure/arrival times, duration, stops, fare, and transport type. | Must |
| FR-012 | The system returns clear empty and error states. | Must |
| FR-020 | A user can view journey details and fare rules. | Must |
| FR-021 | A user can view seat availability where the provider supplies it. | Must |
| FR-022 | Selecting seats creates a temporary hold that expires automatically. | Must |
| FR-023 | The system never allocates one seat to two active bookings. | Must |
| FR-030 | A registered user can create a booking with passenger details. | Must |
| FR-031 | The server calculates all prices. | Must |
| FR-032 | Repeating a booking request with the same idempotency key returns the same result. | Must |
| FR-033 | Booking status follows defined state transitions. | Must |
| FR-034 | A user can cancel a booking if the cancellation rule allows. | Should |
| FR-040 | A user can pay through the approved sandbox provider. | Must |
| FR-041 | Payment results are verified server-side, never trusted from the client. | Must |
| FR-042 | Payment webhooks are signature-verified and processed once. | Must |
| FR-043 | A ticket is issued only for a confirmed, paid booking. | Must |
| FR-044 | Each ticket has a unique reference and a verification procedure. | Must |
| FR-045 | Payment providers are accessed through a common interface so providers can be added or           replaced. | Must |
| FR-050 | A user can see upcoming and past trips and retrieve tickets. | Must |
| FR-051 | A user can see cancellation and refund status. | Should |
| FR-060 | Staff roles can manage simulated schedules and fares. | Should |
| FR-061 | Support agents can look up bookings. | Should |
| FR-062 | Sensitive admin actions produce audit records. | Must |
| FR-070 | Every endpoint enforces role-based authorization on the backend. | Must |

## 5. Non-functional requirements

| ID | Requirement | Priority |
|---|---|---|
| NFR-001 | Passwords stored only as salted hashes using a recommended algorithm. | Must |
| NFR-002 | All traffic over TLS outside local development. | Must |
| NFR-003 | No secrets, tokens, card data, or passwords in code, logs, or Git history. | Must |
| NFR-004 | Money uses integer minor units or decimal types, never floating point. | Must |
| NFR-005 | Search response target to be set after measuring (proposal: p95 under 1 s on seeded data). | Should |
| NFR-006 | Concurrent seat holds are correct under load, proven by a test. | Must |
| NFR-007 | Schema changes only through versioned migrations. | Must |
| NFR-008 | Each Must-level business rule has an automated test. | Must |
| NFR-009 | Structured logs with a correlation ID per request. | Should |
| NFR-010 | Health endpoint and a documented backup/restore procedure. | Should |
| NFR-011 | Mobile UI supports screen readers, scalable text, and sufficient contrast. | Should |
| NFR-012 | Personal data has a documented retention and deletion rule. | Should |

## 6. Open questions (decisions needing confirmation)

1. Currency for the MVP: decided, see ADR-0002 (LRD default, USD supported).
2. Cancellation windows, fees, and refund percentages.
3. Seat hold duration.
4. Ticket validity rules.
5. Maximum passengers per booking.
6. Payment providers: see ADR-0002. MTN, Orange, and Stripe access is to be confirmed on official portals.
7. Course deadline or deliverable format that affects scope.