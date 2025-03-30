## Uinstall postgres

To completely uninstall PostgreSQL from Ubuntu, follow these steps:

### **1. Stop PostgreSQL Service**

```bash
sudo systemctl stop postgresql
```

### **2. Uninstall PostgreSQL and Related Packages**

```bash
sudo apt-get --purge remove postgresql\*
```

This removes PostgreSQL and all related packages.

### **3. Remove PostgreSQL Data Directory**

```bash
sudo rm -rf /var/lib/postgresql/
```

This deletes all databases and user data.

### **4. Remove PostgreSQL Configuration Files**

```bash
sudo rm -rf /etc/postgresql/
sudo rm -rf /etc/postgresql-common/
```

### **5. Remove PostgreSQL User and Group**

```bash
sudo deluser postgres
sudo delgroup postgres
```

### **6. Remove PostgreSQL Logs**

```bash
sudo rm -rf /var/log/postgresql/
```

### **7. Remove PostgreSQL from System Path (if any)**

Check if PostgreSQL is still in your path:

```bash
which psql
```

If it returns a path (e.g., `/usr/bin/psql`), remove it:

```bash
sudo rm /usr/bin/psql
```

### **8. Auto-Remove Any Leftover Dependencies**

```bash
sudo apt-get autoremove
sudo apt-get autoclean
```

### **9. Verify PostgreSQL is Uninstalled**

```bash
psql --version
```

If PostgreSQL is completely removed, this command should return **"command not found"**.

---

### **Optional: Remove PostgreSQL Repository (if added)**

If you added PostgreSQL's official repository, remove it:

```bash
sudo rm -rf /etc/apt/sources.list.d/pgdg.list
sudo apt update
```

Now, PostgreSQL is completely removed from your system! 🚀
