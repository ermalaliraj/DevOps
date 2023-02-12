# MongoDB in Docker

### Docker Compose 
    docker-compose up -d

### Docker 
    docker pull mongo
    docker run --name mongo -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=campus -e MONGO_INITDB_ROOT_PASSWORD=campus mongo

### Connect to DB / Create new User
    mongo mongodb://campus:campus@localhost:27017/admin
    
    use admin
    db.createUser(
      {
        user: "admin",
        pwd: "AdminAdmin",
        passwordDigestor : "server",
        roles: [{ role: "root", db: "admin" }]
      }
    )
    db.getUser("admin")
    db.dropUser("admin", {w: "majority", wtimeout: 4000})
    mongo mongodb://admin:AdminAdmin@localhost:27017/admin

### Connect to the container 
    docker exec -it mongo bash

### Useful commands
    docker logs -f mongo

### Uninstall Mongo
    docker rm $(docker ps --filter status=exited -q)
    docker volume prune

### Links
- [Main](./../README.md)