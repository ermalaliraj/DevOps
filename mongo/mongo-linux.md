# MongoDB in Linux

### Install
[Tutorial - Install Mongo in Ubuntu](1)
```
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

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

### Service
    sudo systemctl start mongod   (start / status / stop / restart / daemon-reload / restart / restart)
    sudo systemctl enable mongod    (to start on system reboot)
    sudo systemctl disable mongod
    
### Useful commands & Errors
    tail -100 /var/log/mongodb/mongod.log
    
    sudo find /tmp -name "*mongo*"
    sudo chown -R mongodb:mongodb /var/lib/mongodb
    sudo chown -R mongodb:mongodb /tmp/mongodb-27017.sock
    rm -f /tmp/mongodb-27017.sock
    
    (code=exited, status=48)  => port already in use 
    (code=exited, status=14)  => check permissions
[Failed to Start](2)
    
### Firewall
    sudo lsof -i | grep mongo
    curl -4 icanhazip.com      (on the remote machine to read the IP, my case 81.242.90.128)
    sudo ufw status            
    sudo ufw allow 27017
    sudo ufw allow from 81.242.90.128 to any port 27017
    sudo ufw status numbered
    sudo ufw delete {num}
    
### Uninstall Mongo
    dpkg -l | grep mongo
    sudo apt purge mongo*
    sudo apt-get purge mongo*
    
    sudo find / -name "*mongo*"
    sudo rm -r /var/log/mongodb
    sudo rm -r /var/lib/mongodb
    sudo rm -r /var/cache/apt/archives/mongodb*
    sudo rm -r /var/lib/apt/lists/repo.mongodb*
    sudo rm -r /var/crash/mongo*
    sudo rm -r /etc/apt/sources.list.d/mongodb-org-6.0.list
    sudo rm -r /usr/bin/mongo*
    sudo rm -r /usr/lib/mongo*
    sudo rm -r /root/.mongo*
    sudo rm -r /var/lib/dpkg/info/mongo*
    sudo rm -r /tmp/mongod*
    sudo rm -r /etc/systemd/system/multi-user.target.wants/mongod.service
    
    sudo rm -r /usr/lib/systemd/system/udo systemctl start mongod
    sudo rm -r /usr/lib/systemd/system/mongodb.service
    sudo rm -r /usr/share/doc/mongo*
    sudo rm -r /var/cache/apt/archives/mongodb*
    
    sudo rm -r /usr/lib/systemd/system/*mongod*
    sudo rm -r /usr/share/man/man1/mongo*
    sudo rm -r /usr/share/vim/vim81/keymap/mongolian_utf-8.vim
    sudo rm -r /var/cache/apt/archives/mongo-tools_3.6.3-0ubuntu1_amd64.deb
    
    sudo rm -r /root/*mongo*
    
### Remove Mongo user
    sudo userdel -r mongodb
    sudo groupdel mongodb
    
    
    
### Links
- [1](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
- [2](https://stackoverflow.com/questions/48092353/failed-to-start-mongod-service-unit-mongod-service-not-found)
- [Main](./../README.md)