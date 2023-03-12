# PostgreSQL

###  Install 
    sudo apt update
    sudo apt install postgresql postgresql-contrib
    sudo su - postgres
    ps -ef | grep postgres
    psql -l 

    psql 
    \q
    
### Allow Remote
    nano /etc/postgresql/14/main/postgresql.conf    (listen_addresses = '*' )
    nano /etc/postgresql/14/main/pg_hba.conf        (host all all 0.0.0.0/0)
    
### Connect
    psql
    \conninfo
    
    psql -a -U ermal -p 5432 -h  127.0.0.1  eatech_dev  (pwd on enter)
    \c eatech_dev
    \dt
   
    SELECT * FROM information_schema.tables;
    
### Create user
    CREATE USER ermal;
    CREATE USER ermal WITH PASSWORD 'pwd';
    
### Create database
    CREATE DATABASE eatech_dev
    WITH
    OWNER = postgres	
    ENCODING = 'UTF8'		
    TABLESPACE = pg_default
    CONNECTION LIMIT = 10;

### Links
- [Main](./../README.md)