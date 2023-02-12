# MySql in Linux

### Install
    sudo apt update
    sudo apt install mysql-server
    
### Service
    sudo systemctl start mysql.service
    sudo systemctl status mysql.service

### Connect
    mysql
    mysql -u root
    
### Creates in FileSystem
    /lib/systemd/system/mysql.service  (/etc/systemd/system/multi-user.target.wants/mysql.service)
    /etc/mysql/mysql.cnf
    /etc/mysql/my.cnf
    /etc/mysql/mysql.conf.d/mysqld.cnf
    /var/log/mysql/error.log
    /var/log/mysqld.log
    
    tail -100 /var/log/mysql/error.log

### Connect form Remote
    nano /etc/mysql/mysql.conf.d/mysqld.cnf       (bind-address = 0.0.0.0)
    sudo systemctl restart mysql
  
### Firewall
    sudo ufw status            
    sudo ufw allow 3306
    
### Create DATABASE and USER
    DROP SCHEMA IF EXISTS `node_training`;
    CREATE SCHEMA `node_training`;
    
    DROP USER ermal@localhost;
    
    CREATE USER ermal@localhost IDENTIFIED BY 'MyPwd';
    GRANT ALL ON node_training.* TO ermal@localhost;
    CREATE USER ermal@'%' IDENTIFIED BY 'MyPwd';
    GRANT ALL ON node_training.* TO ermal@'%';
    
    FLUSH PRIVILEGES;
    
    mysql -uermal -pMyPwd;
    mysql -uermal -h 143.198.147.5 -pMyPwd
    
    ****************     ****************
    use mysql
    SELECT user, host, account_locked, password_expired FROM user;  
    SELECT USER(), CURRENT_USER();
    
### Uninstall
    sudo systemctl stop mysql 
    sudo apt remove mysql-server mysql-client 
    sudo apt autoremove 
    sudo apt autoclean 
    
    sudo find / -name "*mysql*"
    
    sudo rm -rf /etc/mysql 
    sudo rm -rf /var/lib/mysql 
    sudo rm -rf /var/log/mysql
    
    
    
### Links
- [Main](./../README.md)