### Install Certbot for using Nginx with SSL 

### Install
        apt install snapd
        sudo snap install core; sudo snap refresh core
        sudo snap install --classic certbot
        sudo ln -s /snap/bin/certbot /usr/bin/certbot
        certbot certonly --nginx
        certbot --nginx    
        
### Links
[How to certbot](https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal)