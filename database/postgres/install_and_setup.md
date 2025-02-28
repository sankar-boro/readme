### Install

```sh
# Import the repository signing key:
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Update the package lists:
sudo apt-get update
# Install the latest version of PostgreSQL.
sudo apt-get -y install postgresql
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
```

---

After installing PostgreSQL, you need to perform some initial setup to get it running and secure. Here's a step-by-step guide:

---

### **1. Start the PostgreSQL Service**

Ensure PostgreSQL is running:

- On **Linux (systemd-based distributions like Ubuntu, Debian, CentOS, Fedora):**
  ```sh
  sudo systemctl start postgresql
  sudo systemctl enable postgresql  # Auto-start on boot
  ```
- On **macOS (Homebrew installation):**
  ```sh
  brew services start postgresql
  ```
- On **Windows:**  
  PostgreSQL runs as a service by default after installation.

---

### **2. Switch to the PostgreSQL User**

PostgreSQL creates a default system user named `postgres`. Switch to it:

```sh
sudo -i -u postgres
```

---

### **3. Set Up the PostgreSQL Superuser Password**

Start the PostgreSQL interactive shell (`psql`) and set a password for the `postgres` user:

```sh
psql
ALTER USER postgres WITH PASSWORD 'your_secure_password';
\q  # Exit psql
```

---

### **4. Allow Remote Connections (Optional)**

If you need remote access, update these files:

1. **Modify `postgresql.conf`** (typically at `/etc/postgresql/XX/main/postgresql.conf` or `/var/lib/pgsql/data/postgresql.conf`):

   ```sh
   sudo nano /etc/postgresql/XX/main/postgresql.conf
   ```

   Find the `listen_addresses` setting and change it to:

   ```conf
   listen_addresses = '*'
   ```

2. **Modify `pg_hba.conf`** (at `/etc/postgresql/XX/main/pg_hba.conf` or `/var/lib/pgsql/data/pg_hba.conf`):
   ```sh
   sudo nano /etc/postgresql/XX/main/pg_hba.conf
   ```
   Add this line to allow remote connections:
   ```
   host    all             all             0.0.0.0/0               md5
   ```

Restart PostgreSQL:

```sh
sudo systemctl restart postgresql
```

---

### **5. Create a New Database and User**

If you need a new database and user, do the following:

1. **Create a database:**

   ```sh
   createdb my_database
   ```

2. **Create a new user:**

   ```sh
   createuser --interactive --pwprompt
   ```

   - It will ask for a username and password.

3. **Grant privileges:**
   ```sql
   GRANT ALL PRIVILEGES ON DATABASE my_database TO my_user;
   ```

---

### **6. Test Connection**

Exit from the `postgres` user and test the connection:

```sh
psql -U postgres -h localhost
```

Or, if using a different user and database:

```sh
psql -U my_user -d my_database -h localhost
```

---

### **7. Secure PostgreSQL (Recommended)**

- Use **strong passwords** for all database users.
- Restrict remote access using firewall rules (e.g., `ufw` on Ubuntu):
  ```sh
  sudo ufw allow 5432/tcp
  sudo ufw enable
  ```
- Use **role-based access control (RBAC)** for different users.

---

### **8. Enable Automatic Start (If Not Done)**

Ensure PostgreSQL starts on boot:

```sh
sudo systemctl enable postgresql
```

---

### **Next Steps**

- Install a GUI client like **pgAdmin** or **DBeaver** for easier database management.
- Use `psql` to create schemas, tables, and run queries.

Let me know if you need more details! 🚀
