# GrayLog

https://www.graylog.org/
https://graylog.eatechnology.it/ 

### Install
   install
   and configure destination port
    
    
### Service
    the service shpulòd be running:
    systemctl list-units
   
### Application
   
    logback.xml
    <appender name="GELF" class="de.siegmar.logbackgelf.GelfUdpAppender">
       <graylogHost>xxx.xx.xx.xxx</graylogHost>
       <graylogPort>12201</graylogPort>
       <encoder class="de.siegmar.logbackgelf.GelfEncoder">
           <staticField>app_name:jt-public</staticField>
           <staticField>app_env:DEV</staticField>
       </encoder>
    </appender>
       
    pom.xml
    <dependency>
        <groupId>de.siegmar</groupId>
        <artifactId>logback-gelf</artifactId>
        <version>${logback-gelf.version}</version>
    </dependency>
        