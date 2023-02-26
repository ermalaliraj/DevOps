# Jenkins in Linux

### Install
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
    sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins
    
### Service
    /var/lib/jenkins/   (home)
    /var/lib/jenkins/secrets/initialAdminPassword (complete registration)
    
    -- change port
    sudo mkdir /etc/systemd/system/jenkins.service.d
    sudo touch /etc/systemd/system/jenkins.service.d/override.conf
        [Service]
        Environment="JENKINS_PORT=8061"
        
    sudo systemctl daemon-reload
    sudo systemctl stop jenkins
    sudo systemctl start jenkins
    sudo systemctl status jenkins
    sudo systemctl restart jenkins
    journalctl -u jenkins

### Connect & Configure
    http://46.101.139.217:8061
    
    sudo nano /etc/sudoers
        - add: jenkins ALL=(ALL:ALL) NOPASSWD: ALL
    
    sudo -su jenkins
    ssh-keygen            (creates id_rsa, id_rsa.pub, known_hosts in /var/lib/jenkins/.ssh)
    eval $(ssh-agent -s)  (make sure is running)  
   
    Git Account -> Settings -> SSH and GPG keys -> SSH Key -> jenkins-eatech-dev (paste the content of id_rsa.pub)

    Jenkins -> Dashboard -> Manage Jenkins -> Manage Credentials -> System -> Global credentials (unrestricted)
            -> adding some credentials -> New Credentials
    Kind: SSH Username with private key
    username: jenkins
    Private Key: Enter directly -> key (paste the content of id_rsa)

### Jenkins Add Project/Item
    Jenkins -> New Item (free) -> 
        Source Code Management -> 
            Git: SSH link ->
            Credentials: jenkins
        Poll SCM: H/5 * * * *
        Build Environment: Delete workspace before build starts
        Build Steps: 
            1) Invoke top-level Maven targets: clean package -Dmaven.test.skip=true
            2) Execute shell -> echo %Build script here%
            3) Execute shell2 ->  echo %Deploy script here%
                sudo systemctl stop authJwt
                sudo cp /var/lib/jenkins/workspace/auth-jwt-symmetric-demo/target/auth-jwt-symmetric-demo-0.0.1-SNAPSHOT.jar /home/ermal/projects/auth-jwt-symmetric-demo/
                sudo systemctl start authJwt
                sudo systemctl status authJwt
                 
        
### Firewall - Allow remote connection
    sudo ufw status            
    sudo ufw allow 8080
   
### Uninstall Jenkins
    find / -name "*hudson.model.UpdateCenter.xml*"
    apt-get -y remove jenkins
    apt-get remove --purge jenkins
    rm -rf /var/lib/jenkins
    userdel jenkins
    
### Memory Usage
    ******************  After Jenkins installation 46.101.139.217 (2023/02/25) ******************
    root@dev:~# free -g -h -t
                   total        used        free      shared  buff/cache   available
    Mem:           7.8Gi       257Mi       6.1Gi        12Mi       1.5Gi       7.2Gi
    Swap:             0B          0B          0B
    Total:         7.8Gi       257Mi       6.1Gi
    root@dev:~# cat /proc/meminfo | grep -E "MemTotal|MemAvailable|MemFree"
    MemTotal:        8139728 kB
    MemFree:         6352932 kB
    MemAvailable:    7586432 kB
    
### Links
- [Install Jenkins](https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-22-04)
- [Main](./../README.md)