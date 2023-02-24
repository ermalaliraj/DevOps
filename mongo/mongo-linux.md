# MongoDB in Linux

### Install
[Tutorial - Install Mongo in Ubuntu](1)
```
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

-- in case installation fails
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt-get update
sudo apt-get install libssl1.1
```

### Service
    sudo systemctl start mongod   (start / status / stop / restart / daemon-reload / restart / restart)
    sudo systemctl enable mongod    (to start on system reboot)
    sudo systemctl disable mongod
    
### Connect
    mongo
    use admin
    mongosh mongodb://admin:pwd@46.101.139.217:27017/admin (after allowing in mongod.conf and firewall)
    
### Mongo - Allow remote connection 
    nano /etc/mongod.conf
    -- add the parameter:
    net:
      bindIpAll: true
      
### Firewall - Allow remote connection
    sudo ufw status            
    sudo ufw allow 27017
     
### Creates
    /var/lib/mongodb    (mongodb:mongodb) 
    /var/log/mongodb    (mongodb:mongodb)
    /etc/mongod.conf    (root:root)
    /lib/systemd/system/mongod.service

### mongod.service
    [Unit]
    Description=MongoDB Database Server
    Documentation=https://docs.mongodb.org/manual
    After=network-online.target
    Wants=network-online.target

    [Service]
    User=mongodb
    Group=mongodb
    EnvironmentFile=-/etc/default/mongod
    ExecStart=/usr/bin/mongod --config /etc/mongod.conf
    PIDFile=/var/run/mongodb/mongod.pid
    LimitFSIZE=infinity
    LimitCPU=infinity
    LimitAS=infinity
    LimitNOFILE=64000
    LimitNPROC=64000
    LimitMEMLOCK=infinity
    TasksMax=infinity
    TasksAccounting=false
    
### Useful commands & Errors
    tail -100 /var/log/mongodb/mongod.log
    
    sudo find / -name "*mongo*"
    sudo chown -R mongodb:mongodb /var/lib/mongodb
    sudo chown -R mongodb:mongodb /tmp/mongodb-27017.sock
    rm -f /tmp/mongodb-27017.sock
    
    (code=exited, status=48)  => port already in use 
    (code=exited, status=14)  => check permissions
[Failed to Start](2)

### Uninstall Mongo
    dpkg -l | grep mongo
    sudo apt purge mongo*
    sudo apt-get purge mongo*
    
    sudo find / -name "*mongo*"
    
    sudo rm -r /tmp/mongod*
    sudo rm -r /var/log/mongodb*
    sudo rm -r /var/lib/dpkg/info/mongodb*
    sudo rm -r /usr/bin/mongo*
    sudo rm -r /usr/lib/mongo*
    sudo rm -r /usr/share/doc/mongo*
    sudo rm -r /etc/mongo*
    sudo rm -r /etc/apt/sources.list.d/mongodb-org-6.0.list
    sudo rm -r /etc/systemd/system/multi-user.target.wants/mongod.service
    sudo rm -r /root/.mongo*
    
### Remove Mongo user
    sudo userdel -r mongodb
    sudo groupdel mongodb
    
### Memory Usage
    ******************  After Mongo installation 46.101.139.217 ******************
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
- [1](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
- [2](https://stackoverflow.com/questions/48092353/failed-to-start-mongod-service-unit-mongod-service-not-found)
- [Main](./../README.md)