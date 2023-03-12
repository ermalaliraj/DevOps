# Keycloak in Linux

###  Install 
    cd /opt
    sudo wget https://downloads.jboss.org/keycloak/11.0.2/keycloak-11.0.2.tar.gz
    sudo tar -xvzf keycloak-11.0.2.tar.gz
    ln -s keycloak-11.0.2 keycloak
    
### Setup Service
    groupadd keycloak
    useradd -r -g keycloak -d /opt/keycloak -s /sbin/nologin keycloak
    chown -R keycloak: keycloak
    chmod o+x /opt/keycloak/bin/      (no need since we will put launch.sh in /etc/keycloak)
   
    sudo mkdir /etc/keycloak
    (copy files keycloak.conf, keycloak.service and launch.sh in /etc/keycloak/)
    chmod o+x /etc/keycloak/launch.sh
    cp keycloak.service /etc/systemd/system/keycloak.service
    
    systemctl enable keycloak
    systemctl daemon-reload
    systemctl restart keycloak
    
    sudo tail -f /opt/keycloak/standalone/log/server.log
    
    http://127.0.0.1:9990
    http://46.101.139.217:8080
    
### Database
    CREATE DATABASE keycloak;
    CREATE USER keycloak10 WITH ENCRYPTED PASSWORD 'pwd';
    CREATE SCHEMA AUTHORIZATION keycloak10;
    
    psql -a -U keycloak10 -p 5432 -h  127.0.0.1  keycloak  (on console pwd)
    
### Create JBoss module with jdbc driver
    mkdir /opt/keycloak/modules/system/layers/keycloak/org/postgresql
    mkdir /opt/keycloak/modules/system/layers/keycloak/org/postgresql/main
    touch module.xml  (paste the content)
    wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.9/postgresql-42.2.9.jar  (same folder)
    cd ..
    chown -R keycloak: postgresql
    nano /opt/keycloak/standalone/configuration/standalone.xml (paste the content)
 
### Change datasource
    <datasource jndi-name="java:jboss/datasources/KeycloakDS" pool-name="KeycloakDS" enabled="true" use-java-context="true" statistics-enabled="${wildfly.datasources.statistics-enabled:${wildfly.statistics-enabled:false}}">
        <connection-url>jdbc:postgresql://localhost/keycloak</connection-url>
        <driver>postgresql</driver>
        <pool>
            <max-pool-size>20</max-pool-size>
        </pool>
        <security>
            <user-name>keycloak</user-name>
            <password>pwd</password>
        </security>
    </datasource>
    <drivers>
        <driver name="postgresql" module="org.postgresql">
                <xa-datasource-class>org.postgresql.xa.PGXADataSource</xa-datasource-class>
        </driver>
    </drivers>
 
### Initial Administrator User
    cd /opt/keycloak/bin/
    add-user-keycloak.sh -r master -u ermal -p masterPwd
    systemctl restart keycloak
    (still error message: HTTPS required)
    kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user ermal –-password masterPwd
    kcadm.sh update realms/master -s sslRequired=NONE   (disable ssl)
    http://46.101.139.217:8080
    
### Links
- [How to](https://medium.com/@hasnat.saeed/setup-keycloak-server-on-ubuntu-18-04-ed8c7c79a2d9)
- [Main](./../README.md)