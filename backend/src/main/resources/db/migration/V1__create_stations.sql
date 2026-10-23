CREATE TABLE stations (
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code       VARCHAR(10)  NOT NULL UNIQUE,
    name       VARCHAR(100) NOT NULL,
    city       VARCHAR(100) NOT NULL,
    time_zone  VARCHAR(50)  NOT NULL DEFAULT 'Africa/Monrovia',
    created_at TIMESTAMPTZ  NOT NULL DEFAULT now()
);