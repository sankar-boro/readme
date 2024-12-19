#!/bin/bash

curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && 

sudo dpkg -i cloudflared.deb && 

sudo cloudflared service install eyJhIjoiOGY5MWQzMGVhYmJlMDZmNzc0YTdhYjI4MjBkZjY2NGMiLCJ0IjoiNDVkMGUyMDctN2E4Mi00Yzk5LWEyOTgtNTM2MzE5NWVhYzQxIiwicyI6IlltRmhaVGt5WWpVdFpUWXhPUzAwTnpjekxUZzFOekV0TnpBNVltTTVNVEUxTlRrdyJ9

sudo cloudflared service install
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
sudo systemctl status cloudflared
