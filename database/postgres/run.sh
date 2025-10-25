#!/usr/bin/env bash

# Exit on error, unset variable, or failed pipe
set -euo pipefail

# === CONFIGURATION ===
NEW_DB_OWNER="sankar"
NEW_DB_PASSWORD="san@pos#25"

NEW_DB_SCHEMA="basic"
DB_SUPERUSER="postgres"
DB_HOST="localhost"
DB_PORT="5432"

NEW_DB_NAME="auth" # change only this one

echo "=== Setting up database '$NEW_DB_NAME' owned by '$NEW_DB_OWNER' ==="

# Run all SQL commands through psql
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_SUPERUSER" -v ON_ERROR_STOP=1 <<-SQL

-- Create role if it doesn't exist
DO \$\$
BEGIN
    IF NOT EXISTS (
        SELECT FROM pg_roles WHERE rolname = '$NEW_DB_OWNER'
    ) THEN
        CREATE ROLE $NEW_DB_OWNER LOGIN PASSWORD '$NEW_DB_PASSWORD';
        RAISE NOTICE 'Role "$NEW_DB_OWNER" created.';
    ELSE
        RAISE NOTICE 'Role "$NEW_DB_OWNER" already exists.';
    END IF;
END
\$\$;

-- Create database if not exists
CREATE DATABASE $NEW_DB_NAME OWNER $NEW_DB_OWNER;

-- Change ownership
ALTER DATABASE $NEW_DB_NAME OWNER TO $NEW_DB_OWNER;

-- Revoke public access
REVOKE ALL ON DATABASE $NEW_DB_NAME FROM PUBLIC;

\connect $NEW_DB_NAME

DO \$\$
BEGIN
    IF NOT EXISTS (
        SELECT FROM information_schema.schemata WHERE schema_name = '$NEW_DB_SCHEMA'
    ) THEN
        CREATE SCHEMA $NEW_DB_SCHEMA AUTHORIZATION $NEW_DB_OWNER;
        RAISE NOTICE 'Schema "$NEW_DB_SCHEMA" created.';
    ELSE
        RAISE NOTICE 'Schema "$NEW_DB_SCHEMA" already exists.';
    END IF;
END
\$\$;

-- Revoke public access from public schema
REVOKE ALL ON SCHEMA public FROM PUBLIC;

-- Grant schema privileges
GRANT USAGE, CREATE ON SCHEMA $NEW_DB_SCHEMA TO $NEW_DB_OWNER;

-- Grant table privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA $NEW_DB_SCHEMA TO $NEW_DB_OWNER;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA $NEW_DB_SCHEMA
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO $NEW_DB_OWNER;

-- Set search path
ALTER ROLE $NEW_DB_OWNER SET search_path = $NEW_DB_SCHEMA;

SQL

echo "✅ Database '$NEW_DB_NAME' configured successfully!"
