# Create Services on the Server

For each service, create a file my-api.service with the description and than run `install.sh` 
which will create all services at once.
Each time a service definition is changed make sure to run `systemctl daemon-reloadv

    sudo systemctl status my-api
    sudo systemctl start/stop my-api
    
    tail -100f jt-api_2022-12-19.log
    
    
    sudo systemctl status authJwt
    sudo systemctl start authJwt
    sudo systemctl stop authJwt
    
    tail -100f jt-api_2022-12-19.log
    