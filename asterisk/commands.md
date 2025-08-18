```bash
sudo asterisk -rx "core restart now"
sudo asterisk -rx "dialplan reload"
sudo asterisk -rx "pjsip reload"

sudo systemctl restart asterisk
sudo asterisk -rvvvvvv

sudo asterisk -rx "http reload"
sudo asterisk -rx "http show status"

asterisk -rx "bridge show all"
asterisk -rx "core show channels"

```
