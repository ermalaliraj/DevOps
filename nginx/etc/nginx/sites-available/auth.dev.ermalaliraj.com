server {
    server_name auth.dev.ermalaliraj.com;
    access_log /var/log/nginx/auth.dev.ermalaliraj.com.log combined;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP  $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Cookie $http_cookie;

        proxy_pass http://127.0.0.1:8080/;
    }

    #listen [::]:443 ssl ipv6only=on; # managed by Certbot
    #listen 443 ssl; # managed by Certbot
    #ssl_certificate /etc/letsencrypt/live/dev.ermalaliraj.com/fullchain.pem; # managed by Certbot
    #ssl_certificate_key /etc/letsencrypt/live/dev.ermalaliraj.com/privkey.pem; # managed by Certbot
    #include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    #ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    server_name auth.dev.ermalaliraj.com;
    listen 80;
    listen [::]:80;
    return 301 https://$host$request_uri;
}