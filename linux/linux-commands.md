# Linux

DigitalOcean 
- dev.dealofthedeal 46.101.139.217


### Install
    sudo apt-get autoremove
    sudo apt-get clean
    sudo apt-get autoclean

### Processes
    ps -aux | grep java
    top
    kill -9 63772
     
### System Info
    cat /etc/os-release
    hostnamectl
   
    cat /proc/meminfo
    cat /proc/meminfo | grep -E "MemTotal|MemAvailable|MemFree"
    sudo df -h
    sudo du -h  --max-depth 1
    df -h -x tmpfs -x devtmpfs
    
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


### Users
    cat /etc/passwd | grep mongodb
    nano /root/.ssh/authorized_keys
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMHy....

### Links
- [Main](./../README.md)