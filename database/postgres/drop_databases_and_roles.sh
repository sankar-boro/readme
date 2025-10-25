#!/usr/bin/env bash

# Exit on error, unset variable, or failed pipe
set -euo pipefail

# === CONFIGURATION ===
DB_SUPERUSER="postgres"  # Change if needed
DB_HOST="localhost"
DB_PORT="5432"


# Run all SQL commands through psql
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_SUPERUSER" -v ON_ERROR_STOP=1 <<-SQL

-- DROP DATABASE loony;
-- DROP DATABASE aegis;
-- DROP DATABASE auth;

DROP ROLE sankar;

SQL

echo "✅ Databases dropped successfully!"
