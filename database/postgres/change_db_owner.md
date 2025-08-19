Yes, you can change the **owner of a database in PostgreSQL**, but with some caveats.

### Ways to switch database owner

1. **Using `ALTER DATABASE`**

   ```sql
   ALTER DATABASE dbname OWNER TO new_owner;
   ```

   - `dbname` → the name of the database
   - `new_owner` → must be a role that already exists and has `CREATEDB` or superuser privileges

2. **Requirements / Restrictions**

   - You must be a **superuser** or the **current owner** of the database to run this command.
   - The `new_owner` role must have the `CREATEDB` privilege.
   - Ownership does **not automatically cascade** to the objects inside the database (tables, sequences, functions, etc.). You’d need to reassign those separately.

3. **Reassign objects inside the database**
   After changing the database owner, you may want to update the ownership of its objects:

   ```sql
   REASSIGN OWNED BY old_owner TO new_owner;
   ```

   - This reassigns all objects owned by `old_owner` to `new_owner` within the current database.
   - Run this inside the database you want to modify.

4. **Cleanup (optional)**
   If you plan to drop the old role:

   ```sql
   DROP OWNED BY old_owner;
   DROP ROLE old_owner;
   ```

---

✅ Example: Switch database `mydb` from user `alice` to `bob`

```sql
-- Run as superuser
ALTER DATABASE mydb OWNER TO bob;

\c mydb
REASSIGN OWNED BY alice TO bob;
DROP OWNED BY alice;
```

---

Do you want me to give you a **one-shot SQL script** that safely transfers ownership of a database _and all its objects_ to another user?
