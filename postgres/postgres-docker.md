# PostgreSQL in Docker

### Docker Compose 
```
docker-compose up -d
```

### Docker 
```
docker pull postgres
docker run --name postgres -d -p 3432:3432 -e POSTGRES_USER=campus -e POSTGRES_PASSWORD=campus -e POSTGRES_DB=CampusDB postgres
```

### Connect to DB / Create new User

### Connect to the container 
```
docker exec -it postgres bash
```

### Useful commands
```
docker logs -f postgres
```

### Links
- [Main](./../README.md)