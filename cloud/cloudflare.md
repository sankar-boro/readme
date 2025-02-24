Setting up a local server at home with a **Cloudflare Tunnel** allows you to expose your local server securely to the internet without requiring port forwarding. Here's how you can do it:

---

### **Step 1: Prerequisites**

1. **Cloudflare Account**: Ensure you have an account on Cloudflare.
2. **Domain Name**: A domain name managed by Cloudflare. Add your domain to Cloudflare and update its nameservers.
3. **Local Server**: Ensure your local server is running (e.g., a web app, API, or any HTTP-based service).
4. **Cloudflare Tunnel CLI (Cloudflared)**:
   - Download the `cloudflared` binary for your platform from the [Cloudflare GitHub page](https://github.com/cloudflare/cloudflared).

---

### **Step 2: Install Cloudflared**

1. **Download** and **Install**:

   - On Linux:
     ```bash
     wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
     sudo mv cloudflared-linux-amd64 /usr/local/bin/cloudflared
     sudo chmod +x /usr/local/bin/cloudflared
     ```
   - On macOS:
     ```bash
     brew install cloudflared
     ```
   - On Windows:
     Download the `.exe` file and add it to your PATH.

2. **Verify Installation**:
   ```bash
   cloudflared version
   ```

---

### **Step 3: Authenticate Cloudflared**

1. **Login to Cloudflare**:
   ```bash
   cloudflared tunnel login
   ```
   - This will open a browser to authenticate with your Cloudflare account.
   - After authentication, `cloudflared` stores a credentials file in `~/.cloudflared/`.

---

### **Step 4: Create a Tunnel**

1. Create a named tunnel:

   ```bash
   cloudflared tunnel create my-tunnel
   ```

   - This creates a tunnel configuration file and credentials for the tunnel.

2. Note the **tunnel ID** and **credentials location** output after running this command.

---

### **Step 5: Configure the Tunnel**

1. **Define Target Application**:
   Edit or create the configuration file `~/.cloudflared/config.yml`:

   ```yaml
   tunnel: my-tunnel
   credentials-file: /path/to/your/tunnel/credentials.json

   ingress:
     - hostname: your-domain.com
       service: http://localhost:3000
     - service: http_status:404
   ```

   Replace:

   - `your-domain.com` with your domain/subdomain.
   - `http://localhost:3000` with the address of your local service.

2. Add a DNS record for your domain in Cloudflare (this is automatic if you use a subdomain configured with the hostname).

---

### **Step 6: Start the Tunnel**

Run the following command to start the tunnel:

```bash
cloudflared tunnel run my-tunnel
```

- Your local server will now be securely accessible via `https://your-domain.com`.

---

### **Step 7: Automate Tunnel Start**

1. **Run as a Service** (Linux systemd):

   ```bash
   sudo cloudflared service install
   ```

   This will configure the tunnel to start on boot.

2. Start and enable the service:
   ```bash
   sudo systemctl start cloudflared
   sudo systemctl enable cloudflared
   ```

---

### **Step 8: Test Access**

1. Open a browser and go to `https://your-domain.com`.
2. Ensure the local server is accessible and working correctly.

---

### **Additional Notes**

- **Security**: Enable HTTPS and configure any necessary firewall rules.
- **Subdomain Routing**: For multiple services, add additional entries under `ingress` in the `config.yml`.
- **Logs**: Use `cloudflared logs` for debugging.

This setup ensures secure and efficient remote access to your local server without needing complex router configurations.

### Commands

```sh
 cloudflared tunnel list
 cloudflared tunnel run loony
 cloudflared tunnel delete <name>
 cloudflared tunnel route dns loony sankarboro.com
 cloudflared tunnel route ip show
 cloudflared tunnel route ip add 192.168.99.48/24 loony
 cloudflared tunnel route ip delete <id>
```

### Important Links

- https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-local-tunnel/#tab-panel-664
- https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/as-a-service/linux/
- https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/local-management/configuration-file/
