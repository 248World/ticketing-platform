# Data dictionary

Schema is created only through Flyway migrations in
backend/src/main/resources/db/migration. Never edit a migration that has been
applied. Add a new versioned file instead.

## stations (V1)

| Column | Type | Constraints | Meaning |
|---|---|---|---|
| id | BIGINT | identity, primary key | Internal key |
| code | VARCHAR(10) | not null, unique | Short stable station code |
| name | VARCHAR(100) | not null | Display name |
| city | VARCHAR(100) | not null | City, used for search and grouping |
| time_zone | VARCHAR(50) | not null, default Africa/Monrovia | IANA zone used to display local times |
| created_at | TIMESTAMPTZ | not null, default now() | Row creation moment |

Station data in the first release is simulated and must be labeled as such.

## flyway_schema_history

Created and maintained by Flyway. It records which migrations ran and their
checksums. Do not edit it by hand.