# Create Services on the Server

In `/home/ermal/service` bring all service declaration and run `install.sh` to install all in one shot.
Services:
- authJwt.service
- my-api.service

`install.sh` :

    cp *.service /lib/systemd/system
    systemctl enable my-api
    systemctl enable authJwt
    systemctl daemon-reload
    
     journalctl -u authJwt

Other commands

    sudo systemctl status my-api
    sudo systemctl start my-api
    sudo systemctl start my-api
    tail -100f jt-api_2022-12-19.log
    
    sudo systemctl status authJwt
    sudo systemctl start authJwt
    sudo systemctl stop authJwt
    tail -100f jt-api_2022-12-19.log
    
    