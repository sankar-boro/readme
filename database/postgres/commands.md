Good question 👍

The query you showed:

```sql
select * from pg_roles;
```

is a **PostgreSQL system catalog query**. PostgreSQL exposes a number of built-in **system catalogs** (tables and views) that you can query with SQL to inspect metadata about roles, databases, tables, permissions, etc.

Here are some of the most useful ones (similar to `pg_roles`):

---

### 🔑 Roles & Users

- `select * from pg_roles;` → all roles (users + groups).
- `select * from pg_user;` → user accounts (compatibility view).
- `select * from pg_shadow;` → like `pg_user`, but includes password hashes (superuser only).

---

### 📚 Databases & Schemas

- `select * from pg_database;` → list of all databases.
- `select * from pg_tables;` → all tables visible to current user.
- `select * from pg_namespace;` → schemas in the current database.

---

### 📑 Tables, Columns, Indexes

- `select * from pg_class;` → tables, indexes, sequences, views.
- `select * from pg_attribute;` → columns of tables.
- `select * from pg_indexes;` → index definitions.
- `select * from information_schema.tables;` → standard SQL way to see tables.
- `select * from information_schema.columns;` → columns with data types.

---

### 🔐 Permissions

- `select * from information_schema.role_table_grants;` → table privileges.
- `select * from information_schema.role_routine_grants;` → function/procedure privileges.
- `select * from pg_auth_members;` → role membership (who belongs to what group).

---

### ⚡ System Activity

- `select * from pg_stat_activity;` → active sessions, queries being run.
- `select * from pg_locks;` → locks currently held.
- `select * from pg_stat_database;` → statistics per database.

---

### 🛠️ Misc

- `select version();` → PostgreSQL version.
- `select current_database();`
- `select current_user;`
- `select session_user;`
- `\du` (psql command, not SQL) → show roles.
- `\l` or `\list` → list databases.
- `\dt` → list tables.
- `\dn` → list schemas.

---

👉 Basically, **`pg_*` tables/views** are PostgreSQL’s internal catalogs, while **`information_schema.*`** is the ANSI-standard way to get metadata.

Ah, got it — you’re asking about **psql meta-commands** (the backslash `\` shortcuts you can run inside the `psql` shell).

There are **a lot** of them, but here are the most useful grouped by category:

---

## 🔑 Roles & Users

- `\du` → list roles.
- `\dg` → list groups (alias for `\du`).

---

## 📚 Databases

- `\l` or `\list` → list databases.
- `\c <dbname>` or `\connect <dbname>` → connect to a database.
- `\conninfo` → show connection info.

---

## 📂 Schemas, Tables, Views

- `\dn` → list schemas.
- `\dt` → list tables.
- `\dv` → list views.
- `\dm` → list materialized views.
- `\ds` → list sequences.
- `\d[S+]` → describe objects (see details).
- `\d <table>` → describe a table’s structure.
- `\di` → list indexes.
- `\df` → list functions.
- `\da` → list aggregates.
- `\do` → list operators.
- `\dT` → list data types.

---

## 📝 Query Buffers & Scripts

- `\i file.sql` → execute SQL from a file.
- `\e` → open query editor (`$EDITOR`).
- `\p` → show query buffer.
- `\g` → execute query buffer.
- `\g filename` → send query results to a file.
- `\gexec` → execute each query result as SQL.

---

## 📊 Output Formatting

- `\x` → toggle expanded display.
- `\a` → toggle between aligned and unaligned output.
- `\H` → output as HTML.
- `\pset <option>` → set output formatting (border, expanded, etc.).

---

## ⚡ Monitoring

- `\watch [seconds]` → re-run last query every N seconds.
- `\timing` → toggle query execution time display.

---

## 🔐 Access & Permissions

- `\password [role]` → change password.

---

## 🛠️ Misc

- `\q` → quit.
- `\! <command>` → run shell command.
- `\?` → help on psql commands.
- `\h [command]` → help on SQL syntax (e.g., `\h select`).

---

👉 If you run just:

```sql
\?
```

inside `psql`, you’ll see the **complete list** of shortcuts (over 100+).

Would you like me to build you a **compact cheat sheet PDF** of these commands (grouped by category) so you can keep it handy?
