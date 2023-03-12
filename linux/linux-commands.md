# Linux

DigitalOcean 
- eatech-dev-8gb 46.101.139.217


### Install
    sudo apt-get autoremove
    sudo apt-get clean
    sudo apt-get autoclean

### Processes
    ps -aux | grep java
    top
    kill -9 63772
    find / -name "*.service" -not \( -path "/tmp" -type d -prune \) | sort -V
    find /lib/systemd/system -name "*.service" 
    find /lib/systemd/system -name "jenkins.service" 
    sudo lsof -i | grep 8080
    sudo netstat -tunlp
    getent passwd
    getent passwd | grep jenkins
### System Info
    cat /etc/os-release
    hostnamectl
   
    cat /proc/meminfo
    cat /proc/meminfo | grep -E "MemTotal|MemAvailable|MemFree"
    sudo df -h
    sudo du -h  --max-depth 1
    df -h -x tmpfs -x devtmpfs
    
    ip link show   (network interface)
    
    sudo lsof -i -P -n | grep LISTEN
    free -g -h -t

### Memory Usage
    ******************  FRESH 46.101.139.217 ******************
    root@dev:~# free -g -h -t
                   total        used        free      shared  buff/cache   available
    Mem:           7.8Gi       177Mi       7.1Gi       0.0Ki       459Mi       7.4Gi
    Swap:             0B          0B          0B
    Total:         7.8Gi       177Mi       7.1Gi
    
    root@dev:~# cat /proc/meminfo | grep -E "MemTotal|MemAvailable|MemFree"
    MemTotal:        8139732 kB
    MemFree:         7477324 kB
    MemAvailable:    7699996 kB

### 
    /etc/iptables/iptables.sh
    
### Packages 
    apt-key list
    sudo rm /etc/apt/sources.list.d/*  (danger!)
    sudo apt update
    
### Firewall - Allow remote connection
    sudo apt-get install ufw  (if new)
    sudo ufw enable
    sudo lsof -i | grep mongo
    curl -4 icanhazip.com      (on the remote machine to read the IP, my case 81.242.90.128)
    sudo ufw status            
    sudo ufw allow 27017
    sudo ufw allow from 81.242.90.128 to any port 27017
    sudo ufw status numbered
    sudo ufw delete {num}
    
### Users
    useradd -d /home/ermal -s /bin/bash ermal
    passwd ermal
    nano /etc/sudoers (ermal ALL=(all:all) ALL
    su - ermal
    ssh-keygen -t rsa -b 4096
    nano .ssh /authorized_keys   (copy the public keys of machine which want to connect. linux passwordless authentication)
    chmod 600 .shh/authorized_keys
    
    cat /etc/passwd
    
    getent passwd
    getent group
    userdel jenkins

    nano /root/.ssh/authorized_keys  (for the root)
   
### Links
- [Main](./../README.md)