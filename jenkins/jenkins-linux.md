# Jenkins in Linux

### Install
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
    sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins
    
### Service
    sudo systemctl status jenkins.service
    sudo systemctl start jenkins.service
    sudo systemctl stop jenkins.service

### Connect
    http://46.101.139.217:8080
   
### Firewall - Allow remote connection
    sudo ufw status            
    sudo ufw allow 8080
    
### Uninstall Jenkins
    find / -name "*jenkins*"
    
### Links
- [Install Jenkins](https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-22-04)
- [Main](./../README.md)