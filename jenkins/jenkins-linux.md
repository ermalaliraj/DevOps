# Jenkins in Linux

### Install
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
    sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins
    
### Service
    sudo systemctl status jenkins   (start/stop)
    journalctl -u jenkins
    /var/lib/jenkins/   (home)
    /var/lib/jenkins/secrets/initialAdminPassword (complete registration)
    
### Connect & Configure
    http://46.101.139.217:8080
    
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

### Connect & Configure
    Jenkins -> New Item (free) -> 
        Source Code Management -> 
            Git: SSH link ->
            Credentials: jenkins
        Poll SCM: H/5 * * * *
        Build Environment: Delete workspace before build starts
        Build Steps: 
            1) Invoke top-level Maven targets: clean package -Dmaven.test.skip=true
            2) Execute shell -> echo %Build script here%
            3) Execute shell2 -> e
                sudo systemctl stop serviceName
                sudo cp /var/lib/jenkins/workspace/appName/target/appName.jar /home/appUser/projects/appName/
                sudo systemctl start serviceName
        
### Firewall - Allow remote connection
    sudo ufw status            
    sudo ufw allow 8080
   
   
   
    
### Uninstall Jenkins
    find / -name "*hudson.model.UpdateCenter.xml*"
    apt-get -y remove jenkins
    apt-get remove --purge jenkins
    rm -rf /var/lib/jenkins
    userdel jenkins
    
### Links
- [Install Jenkins](https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-22-04)
- [Main](./../README.md)