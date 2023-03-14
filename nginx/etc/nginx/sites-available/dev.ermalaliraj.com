server {
    server_name dev.ermalaliraj.com;
    access_log /var/log/nginx/dev.ermalaliraj.com.log combined;

    root /home/ermal/projects/ermalaliraj.com/dev/;

    location / {
        add_header Cache-Control no-cache;
        expires 1s;
        try_files $uri $uri/ /index.html;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/dev.ermalaliraj.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/dev.ermalaliraj.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
 }

 server {
    server_name dev.ermalaliraj.com;
     listen 80;
     listen [::]:80;
     return 301 https://$host$request_uri;
 }
 server {
     if ($host = dev.ermalaliraj.com) {
         return 301 https://$host$request_uri;
     } # managed by Certbot

     server_name dev.ermalaliraj.com;
     listen 80;
     return 404; # managed by Certbot
 }