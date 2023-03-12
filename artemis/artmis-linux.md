# Artemis in Linux

###  Install 
    cd /opt
    wget https://downloads.apache.org/activemq/activemq-artemis/2.28.0/apache-artemis-2.28.0-bin.tar.gz   
    tar xvf apache-artemis-2.28.0-bin.tar.gz
    cd apache-artemis-2.28.0/bin/
    mkdir /var/lib/artemis     
    ./artemis create /var/lib/artemis            (user artemis / nologin)
    
    /var/lib/artemis/bin/artemis run             (start the broker)
    /var/lib/artemis/bin/artemis-service start   (run the broker in the background )
    
### Config
Adjust /var/lib/artemis/etc/broker.xml:
    
    -- not for now  
    <address name="KeycloakQueue">
        <anycast>
           <queue name="KeycloakQueue" />
        </anycast>
    </address>

### Setup Service +  user

    groupadd -r artemis
    useradd -r -g artemis -d /var/lib/artemis -s /sbin/nologin artemis
    chown -R artemis:artemis /var/lib/artemis
    cp artemis.service /etc/systemd/system/        (artemis.service file in same folder)
    systemctl enable artemis
    systemctl daemon-reload
    systemctl start artemis    

### Links
- [Main](./../README.md)