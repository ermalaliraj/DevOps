server {
    server_name dev.ermalaliraj.com;
    access_log /var/log/nginx/dev.ermalaliraj.com.log combined;

    root /home/ermal/projects/ermalaliraj.com/dev/;

    location / {
        add_header Cache-Control no-cache;
        expires 1s;
        try_files $uri $uri/ /index.html;
    }
}

server {
    server_name dev.ermalaliraj.com;
    listen 80;
    listen [::]:80;
    return 301 https://$host$request_uri;
}
