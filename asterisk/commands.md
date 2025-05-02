```bash
sudo asterisk -rx "core restart now"
sudo asterisk -rx "http show status"
sudo asterisk -rx "http reload"

sudo asterisk -rvvvvvv
sudo systemctl restart asterisk
sudo asterisk -rx "dialplan reload"
sudo asterisk -rx "pjsip reload"
```
