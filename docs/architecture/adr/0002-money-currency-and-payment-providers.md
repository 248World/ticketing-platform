# ADR-0002: Money, currency, and payment providers

Status: Accepted (2026-10-17)

## Context
The service area is Liberia. Default currency is LRD; USD is also supported.
Real provider access needs company registration, KYC, or approvals that a
student project may not obtain. Provider facts below come from third-party
sources and must be confirmed on each official portal.

## Decision
- Every amount is an integer in minor units plus an ISO 4217 currency code.
  The minor-unit count for LRD is to be verified against the ISO 4217 table.
- Each fare has one currency. No automatic conversion in the MVP. If conversion
  is added later, the exchange rate is a stored, dated record.
- Payments go through a common PaymentProvider interface.
- Providers, in order: (1) simulated provider, the MVP default; (2) MTN MoMo
  sandbox, if time remains; (3) Orange Mobile Liberia, access route unconfirmed;
  (4) card payments via Stripe, eligibility unconfirmed (depends on where the
  business is registered).
- Real money is out of scope.

## Consequences
- The MoMo sandbox reportedly supports EUR only, cannot call back the
  application, and the Collections API has no refund endpoint (to confirm).
  Webhook and refund behavior is therefore tested against the simulated provider.
- The booking rule "confirm only after server-side payment verification" is
  independent of any provider.