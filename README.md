# Train and Bus Ticketing Platform

Student engineering project: a mobile app and backend for searching,
booking, and paying for train and bus journeys.

**Status:** early development. The first version uses a simulated transport
provider and sandbox payments. Its tickets are not valid with any real operator.

## Planned stack
Flutter, Spring Boot (Java), PostgreSQL, Docker Compose, GitHub Actions.
Final choices are recorded as ADRs in docs/architecture.

## Documentation
- Requirements: docs/requirements/requirements.md
- Tool versions used: docs/environment-versions.txt

## Local setup
Copy .env.example to .env and set your own values. Never commit .env.
Setup steps for the database and backend will be added as they are built.

## Local database
- Start: `docker compose --env-file .env -f infra\docker-compose.yml up -d`
- Status: `docker compose --env-file .env -f infra\docker-compose.yml ps`
- Test: `docker compose --env-file .env -f infra\docker-compose.yml exec db psql -U <DB_USER> -d <DB_NAME> -c "SELECT version();"`
- Stop (keeps data): `docker compose --env-file .env -f infra\docker-compose.yml down`

The database listens on 127.0.0.1 only. PostgreSQL 18+ images expect the data
volume at /var/lib/postgresql, not /var/lib/postgresql/data.

## Backend

Requires Java 21 and Maven 3.9+ (see docs/environment-versions.txt).
Spring Boot 4.1.1, chosen in docs/architecture/adr/0003-spring-boot-version.md.

- Build and test: `cd backend` then `mvn verify`
- Run: `mvn spring-boot:run`
- Health check: `http://localhost:8080/actuator/health` returns status UP