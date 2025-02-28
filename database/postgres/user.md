To list all users (roles) in PostgreSQL, run:

### **1. Using `psql` command-line**

In the `psql` interactive shell, execute:

```sql
\du
```

---

### **2. Using SQL Query**

If you need a detailed list with attributes, run:

```sql
SELECT rolname, rolsuper, rolcreatedb, rolcanlogin
FROM pg_roles;
```

This will show:

- `rolname` → The role name (user)
- `rolsuper` → If the user is a superuser (`true/false`)
- `rolcreatedb` → If the user can create databases
- `rolcanlogin` → If the role can log in

Would you like help filtering or modifying users? 🚀

To **delete a PostgreSQL user (role) and drop all their privileges**, follow these steps:

---

### **1. Revoke Privileges from the User**

Before deleting the user, revoke all privileges and remove them from any groups:

```sql
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM your_user;
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM your_user;
REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public FROM your_user;
REVOKE ALL PRIVILEGES ON DATABASE your_database FROM your_user;
REVOKE ALL ON SCHEMA public FROM your_user;
```

If the user is a member of any role, remove them:

```sql
REVOKE ALL PRIVILEGES ON SCHEMA public FROM your_user;
REVOKE MEMBERSHIP IN ROLE your_role FROM your_user;
```

---

### **2. Terminate Active Sessions**

Before dropping the user, ensure they are not connected:

```sql
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE usename = 'your_user';
```

---

### **3. Drop the User**

Once all privileges are revoked and sessions are terminated, drop the user:

```sql
DROP ROLE your_user;
```

---

### **Alternative: Drop User with Cascade**

If the user owns objects (tables, sequences, etc.), either **transfer ownership** or use `CASCADE` to drop them:

```sql
DROP OWNED BY your_user CASCADE;
DROP ROLE your_user;
```

Would you like a script to automate this? 🚀
