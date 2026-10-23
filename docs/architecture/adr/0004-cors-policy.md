# ADR-0004: CORS policy

Status: Accepted (2026-10-23)

## Context
The Flutter web app (Chrome, port 5000 in development) and the backend (port 8080)
are different origins. Browsers block such calls unless the server explicitly
allows the calling origin. Native mobile apps are not subject to this rule.

## Decision
- Allow only the origins listed in the property app.cors.allowed-origins
  (default http://localhost:5000), only for GET, only under /api/**.
- Never use a wildcard origin. Production origins are set through configuration,
  not code.
- Tests: the configured origin gets the allow header; an unknown origin is
  rejected with 403.

## Consequences
- Adding write endpoints later requires deliberately widening allowed methods
  and headers, together with authentication decisions.
- CORS is a browser protection only. It does not replace authentication or
  authorization on the server.