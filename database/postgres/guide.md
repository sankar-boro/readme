### Alter column name

```sql
ALTER TABLE <table-name>
RENAME COLUMN <old-column-name> TO <new-column-name>;
```

### Get last row of table

```sql
SELECT *
FROM <table-name>
ORDER BY <table-uid> DESC
LIMIT 1;
```

### Get current id_seq of table in postgres

```sql
SELECT currval('<table-name>_<table-uid>_seq');
SELECT nextval('<table-name>_<table-uid>_seq');
```

### Alter sequence

```sql
ALTER SEQUENCE org_contractors_uid_seq RESTART WITH 56;
ALTER SEQUENCE contractors_contractor_id_seq RESTART WITH 5;
```

### Alter table text to int

```sql
ALTER TABLE purchased_order ADD COLUMN pgroup_id_int integer;
UPDATE purchased_order SET pgroup_id_int = pgroup_id::integer;
ALTER TABLE purchased_order DROP COLUMN pgroup_id;
ALTER TABLE purchased_order RENAME COLUMN pgroup_id_int TO pgroup_id;
```
