# POSTGRES INSTALLATION AND SETUP

### Install

```sh
# Import the repository signing key:
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
sudo apt-get -y install postgresql

# If you want a specific version, use 'postgresql-17' or similar instead of 'postgresql':
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
ALTER USER postgres WITH PASSWORD '<PASSWORD>';
\q  # Exit psql
```

---

### **4. Create a New Database and User**

1. **Log in to PostgreSQL**

   ```sh
   psql -U postgres
   ```

2. **Create a new database**

   ```sql
   CREATE DATABASE <DATABASE>;
   ```

3. **Create a new user**

   ```sql
   CREATE USER <USERNAME> WITH ENCRYPTED PASSWORD '<PASSWORD>';
   ```

4. **Grant privileges on the database**

   ```sql
   GRANT CONNECT, TEMPORARY ON DATABASE <DATABASE> TO <USERNAME>;
   ```

5. **Grant privileges on all current tables**  
   Switch to the newly created database:

   ```sh
   \c <DATABASE>
   ```

   Run:

   ```sql
   GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO <USERNAME>;
   ```

6. **Ensure future tables get the same permissions**

   ```sql
   ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO <USERNAME>;
   ```

7. **Grant privileges on sequences (for auto-increment fields)**
   ```sql
   GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO <USERNAME>;
   ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO <USERNAME>;
   ```

---

### **5. Secure PostgreSQL (Recommended)**

- Use **strong passwords** for all database users.
- Restrict remote access using firewall rules (e.g., `ufw` on Ubuntu):
  ```sh
  sudo ufw allow 5432/tcp
  sudo ufw enable
  ```
- Use **role-based access control (RBAC)** for different users.

---

### **6. Enable Automatic Start (If Not Done)**

Ensure PostgreSQL starts on boot:

```sh
sudo systemctl enable postgresql
```
