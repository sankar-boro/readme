Installing a free SSL certificate from Let's Encrypt on a Linux server typically involves using the Certbot tool. Here's a step-by-step guide:

---

### **Step 1: Update Your System**

Ensure your system is up to date.

```bash
sudo apt update && sudo apt upgrade -y   # For Debian/Ubuntu
```

---

### **Step 2: Install Certbot**

Install Certbot and the necessary plugin for your web server.

- **For Apache**:

  ```bash
  sudo apt install certbot python3-certbot-apache   # Debian/Ubuntu
  ```

- **For Nginx**:
  ```bash
  sudo apt install certbot python3-certbot-nginx    # Debian/Ubuntu
  ```

---

### **Step 3: Obtain the SSL Certificate**

Run Certbot to generate and install the SSL certificate.

- **For Apache**:

  ```bash
  sudo certbot --apache
  ```

- **For Nginx**:
  ```bash
  sudo certbot --nginx
  ```

Saving debug log to /var/log/letsencrypt/letsencrypt.log
Please enter the domain name(s) you would like on your certificate (comma and/or
space separated) (Enter 'c' to cancel): lovegood.in
Requesting a certificate for lovegood.in

Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/lovegood.in/fullchain.pem
Key is saved at: /etc/letsencrypt/live/lovegood.in/privkey.pem
This certificate expires on 2025-04-10.
These files will be updated when the certificate renews.
Certbot has set up a scheduled task to automatically renew this certificate in the background.

Deploying certificate
Successfully deployed certificate for lovegood.in to /etc/nginx/sites-enabled/default
Congratulations! You have successfully enabled HTTPS on https://lovegood.in

---

If you like Certbot, please consider supporting our work by:

- Donating to ISRG / Let's Encrypt: https://letsencrypt.org/donate
- Donating to EFF: https://eff.org/donate-le

---
