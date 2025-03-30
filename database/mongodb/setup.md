It sounds like you might be facing permission issues while trying to run `mongod` as a service. Here are a few steps to troubleshoot and fix the issue:

### 1. **Check Service Status**

Run:

```bash
sudo systemctl status mongod
```

Look for any permission-related errors in the output.

---

### 2. **Check File Permissions**

Ensure that MongoDB has proper permissions for its data and log directories.

```bash
ls -ld /var/lib/mongodb
ls -ld /var/log/mongodb
```

If the owner is incorrect, fix it:

```bash
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown -R mongodb:mongodb /var/log/mongodb
```

Then restart the service:

```bash
sudo systemctl restart mongod
```

---

### 3. **Check System Logs**

If permissions still cause issues, check logs:

```bash
journalctl -xeu mongod
```

or

```bash
cat /var/log/mongodb/mongod.log
```

---

### 4. **Ensure Proper SELinux/AppArmor Configuration**

If you're using **SELinux**, temporarily disable it to check if it's causing issues:

```bash
sudo setenforce 0
sudo systemctl restart mongod
```

If it works, you may need to adjust SELinux policies.

For **AppArmor** (Ubuntu/Debian):

```bash
sudo aa-status
```

If AppArmor is blocking MongoDB, try disabling it temporarily:

```bash
sudo systemctl stop apparmor
```

---

### 5. **Check Systemd Service File**

Check if the MongoDB service file (`/lib/systemd/system/mongod.service`) has the right permissions:

```bash
ls -l /lib/systemd/system/mongod.service
```

It should be owned by `root` with permissions `644`. If not, fix it:

```bash
sudo chmod 644 /lib/systemd/system/mongod.service
sudo systemctl daemon-reload
```

---

### 6. **Run as Root (Temporary Debugging)**

Try starting MongoDB manually with root privileges to check if it’s a permission issue:

```bash
sudo mongod --dbpath /var/lib/mongodb --logpath /var/log/mongodb/mongod.log --fork
```

If this works, the service configuration likely has permission issues.

---

### 7. **Check User Running the Service**

Ensure that MongoDB is running under the correct user (`mongodb`):

```bash
ps aux | grep mongod
```

If it’s running under an incorrect user, update the service file (`/lib/systemd/system/mongod.service`) to explicitly set:

```
User=mongodb
Group=mongodb
```

Then reload and restart:

```bash
sudo systemctl daemon-reload
sudo systemctl restart mongod
```

---

### 8. **Try Reinstalling MongoDB**

If none of the above work, reinstall MongoDB:

```bash
sudo apt-get remove --purge mongodb-org
sudo apt-get install -y mongodb-org
```

Let me know if any specific error logs show up, and I can help debug further! 🚀

To give full permissions to MongoDB on the path `/home/sankar/mongodb/db1`, follow these steps:

---

### **1. Change Ownership to `mongodb` User**

MongoDB runs under the `mongodb` user (if installed as a service). You need to transfer ownership of the directory:

```bash
sudo chown -R mongodb:mongodb /home/sankar/mongodb/db1
```

This ensures MongoDB has full access to the directory.

---

### **2. Set Correct Permissions**

Give full read, write, and execute permissions to the `mongodb` user:

```bash
sudo chmod -R 0755 /home/sankar/mongodb/db1
```

- `0755` allows:
  - Owner (`mongodb`): **read, write, execute**
  - Group: **read, execute**
  - Others: **read, execute**

If you want **full access for everyone** (not recommended for security reasons):

```bash
sudo chmod -R 777 /home/sankar/mongodb/db1
```

---

### **3. Allow MongoDB to Access `/home/sankar`**

Since `/home/sankar` is usually owned by your user, MongoDB might still be restricted. You need to make sure MongoDB can traverse your home directory:

```bash
sudo chmod o+rx /home/sankar
```

This gives **"others"** execute (`x`) and read (`r`) permission to enter the home directory.

---

### **4. Update MongoDB Config to Use This Path**

Edit your MongoDB config file:

```bash
sudo nano /etc/mongod.conf
```

Find the `dbPath` section and update it:

```yaml
storage:
  dbPath: /home/sankar/mongodb/db1
```

Save (`Ctrl + X`, then `Y`, then `Enter`).

---

### **5. Restart MongoDB**

Now restart MongoDB for changes to take effect:

```bash
sudo systemctl restart mongod
```

Check if MongoDB is running properly:

```bash
sudo systemctl status mongod
```

---

### **6. Verify MongoDB Access**

Run:

```bash
ls -ld /home/sankar/mongodb/db1
```

You should see:

```
drwxr-xr-x 4 mongodb mongodb 4096 Mar 15 12:34 /home/sankar/mongodb/db1
```

If everything looks good, MongoDB should now have full access.

---

### **7. (Optional) SELinux/AppArmor Consideration**

If you have SELinux or AppArmor enabled, MongoDB might still be blocked. If needed, temporarily disable SELinux:

```bash
sudo setenforce 0
```

For AppArmor, you may need to adjust its profile or disable it:

```bash
sudo systemctl stop apparmor
```

Let me know if you run into any issues! 🚀
