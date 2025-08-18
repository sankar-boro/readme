# redirect http to https
server {
    if ($host = web.skibidinocap.com) {
        return 301 https://$host$request_uri;
    }

    listen 80;
    
    server_name web.skibidinocap.com 13.201.128.64;

}

server {

    server_name web.skibidinocap.com 13.201.128.64;

    root /var/www/html/;
    index index.html;

    access_log /var/log/nginx/web.skibidinocap.com.access.log;
    error_log /var/log/nginx/web.skibidinocap.com.error.log;

    location / {
        try_files $uri /index.html;
    }

    location /v1 {
        proxy_pass http://127.0.0.1:9000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/web.skibidinocap.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/web.skibidinocap.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

}