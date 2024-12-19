#!/usr/bin/env bash

# Variables (edit these as needed)
USERNAME="<username>"
PASSWORD="<password>"
DATABASE_NAME="<database-name>"

# Run PostgreSQL commands
sudo -u postgres psql <<EOF
CREATE USER $USERNAME WITH PASSWORD '$PASSWORD';
CREATE DATABASE $DATABASE_NAME;
GRANT ALL PRIVILEGES ON DATABASE $DATABASE_NAME TO $USERNAME;
ALTER USER $USERNAME WITH SUPERUSER;
EOF
