Here’s a list of commonly used Nginx commands to help you manage your server:

---

### **Basic Nginx Commands**

1. **Start Nginx**:

   ```bash
   sudo service nginx start
   ```

2. **Stop Nginx**:

   ```bash
   sudo service nginx stop
   ```

3. **Restart Nginx** (Stops and starts Nginx):

   ```bash
   sudo service nginx restart
   ```

4. **Reload Nginx Configuration** (Apply changes without restarting):

   ```bash
   sudo service nginx reload
   ```

5. **Check Nginx Status**:
   ```bash
   sudo service nginx status
   ```

---

### **Configuration Testing and Debugging**

1. **Test Nginx Configuration** (Validate changes before reloading or restarting):

   ```bash
   sudo nginx -t
   ```

2. **View Nginx Version**:

   ```bash
   nginx -v
   ```

3. **View Nginx Version with Build Details**:
   ```bash
   nginx -V
   ```

---

### **Log Management**

1. **View Access Logs**:

   ```bash
   sudo tail -f /var/log/nginx/access.log
   ```

2. **View Error Logs**:

   ```bash
   sudo tail -f /var/log/nginx/error.log
   ```

3. **Monitor Logs in Real-Time**:
   ```bash
   sudo tail -f /var/log/nginx/*.log
   ```

---

### **Advanced Nginx Commands**

1. **Reload with Custom Configuration File**:
   If you want to test Nginx with a custom configuration:

   ```bash
   sudo nginx -c /path/to/custom/nginx.conf
   ```

2. **Stop All Worker Processes**:

   ```bash
   sudo nginx -s stop
   ```

3. **Gracefully Shut Down Nginx**:

   ```bash
   sudo nginx -s quit
   ```

4. **Reopen Log Files**:
   Useful if log files are rotated and you want Nginx to recognize the new ones:
   ```bash
   sudo nginx -s reopen
   ```

---

### **File Management**

1. **Location of Configuration File**:
   Default configuration file is located at:

   - `/etc/nginx/nginx.conf` (Linux)
   - `/usr/local/etc/nginx/nginx.conf` (MacOS)
   - `/etc/nginx/sites-available/default` (Per-site configuration for some Linux distributions like Ubuntu).

2. **Enable a Site Configuration**:
   If using `sites-available` and `sites-enabled` directories:

   ```bash
   sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
   ```

3. **Disable a Site Configuration**:
   ```bash
   sudo rm /etc/nginx/sites-enabled/example.com
   ```

---

### **Nginx Process Management**

1. **Check Running Nginx Processes**:

   ```bash
   ps aux | grep nginx
   ```

2. **Kill All Nginx Processes**:

   ```bash
   sudo pkill nginx
   ```

3. **Run Nginx in Debug Mode**:
   ```bash
   sudo nginx -g 'debug;'
   ```

---

### Notes

- **`sudo`**: Use `sudo` for commands if you’re not logged in as the root user.
- Always back up your Nginx configuration files before making changes:
  ```bash
  sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
  ```
