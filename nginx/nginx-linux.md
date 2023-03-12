# Ngnix in Linux

### Install
[Tutorial - Install nginx](http://nginx.org/en/linux_packages.html)
    
    sudo apt update
    sudo apt install nginx
    
    root@dev:find / -name  "nginx"
    /var/cache/nginx
    /var/log/nginx
    /etc/logrotate.d/nginx
    /etc/nginx
    /etc/default/nginx
    /etc/init.d/nginx
    /usr/lib/nginx
    /usr/sbin/nginx
    /usr/share/lintian/overrides/nginx
    /usr/share/doc/nginx
    /usr/share/nginx
    /usr/share/nginx/html  => public page
    
    sudo service nginx status (reload / start / stop / restart)
    
    /etc/nginx/sites-available
    /var/log/nginx/error.log
    
### Service
    cat /etc/nginx/sites-available/default
    cd /etc/nginx/sites-enabled/
    ln -s ../sites-available/default default
    

### Links
- [1](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
- [2](https://stackoverflow.com/questions/48092353/failed-to-start-mongod-service-unit-mongod-service-not-found)
- [Main](./../README.md)