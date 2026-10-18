# ADR-0003: Spring Boot version

Status: Accepted (2026-10-18)

## Context
The backend needs a pinned Spring Boot version that works with the installed
toolchain (Java 21.0.12.1, Maven 3.9.16). Spring's documentation for the 4.1 line
states that it requires at least Java 17, is compatible up to Java 26, and
supports Maven 3.6.3 or later. The pages read were snapshot documentation, so
the exact 4.1.1 reference page should be re-checked when convenient.

## Decision
- Use Spring Boot 4.1.1, the highest stable version offered by start.spring.io
  on 2026-10-18 (no SNAPSHOT, milestone, or release-candidate label).
- Compile for Java 21 (java.version=21 in pom.xml).
- Pin the version in pom.xml. Do not upgrade during development without a new ADR.
- Starters in use so far: actuator, webmvc, and their test starters.

## Alternatives considered
- Spring Boot 3.5.x (previous major line): a safe choice with more existing
  tutorials, but it would be one major version behind from day one.

## Consequences
- Spring Boot 4 reorganized test packages (for example
  org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc), so
  older tutorials and AI-generated examples may not compile. Check imports
  against the actual jars.
- Verified in this environment: mvn verify passes, and the application starts.