# MongoDB Commands

### Connect 
```
mongo mongodb://campus:campus@localhost:27017/admin
```

### Backup & Restore
Pre: [MongoDB Tools](https://www.mongodb.com/try/download/shell)
```
mongodump --uri "mongodb://campus:campus@localhost:27017/admin?authSource=admin" -o ./backup
mongorestore --uri "mongodb+srv://user:pwd@ip/new_schema" --drop -d new_schema ./backup/admin
```

### Create new User
Admin user
```
use admin
db.createUser(
  {
    user: "admin",
    pwd: "AdminAdmin",
	passwordDigestor : "server",
    roles: [{ role: "root", db: "admin" }]
  }
)
mongo mongodb://admin:AdminAdmin@localhost:27017/admin
```

User2 admin of 2 databases 
```
use db_local
db.createUser(
	{
		user: "user2",
		pwd: "user2user2",
		passwordDigestor : "server",
		roles: [ { role: "dbAdmin", db: "db_local" } ]
	}
)
db.grantRolesToUser('user2',[{ role: "readWrite", db: "admin" }]) 
mongo mongodb://user2:user2user2@localhost:27017/db_local?authSource=db_local
mongo mongodb://user2:user2user2@localhost:27017/admin?authSource=admin  (to be tested)
```

### Other commands
```
db.getUser("admin")
db.dropUser("admin", {w: "majority", wtimeout: 4000})
```

### Check Connections
    db.serverStatus().connections
    db.currentOp(true).inprog.forEach(function(x) { print(x.client) })
    db.currentOp(true).inprog.reduce((accumulator, connection) => { ipaddress = connection.client ? connection.client.split(":")[0] : "Internal"; accumulator[ipaddress] = (accumulator[ipaddress] || 0) + 1; accumulator["TOTAL_CONNECTION_COUNT"]++; return accumulator; }, { TOTAL_CONNECTION_COUNT: 0 })
    db.currentOp(true).inprog.reduce((accumulator, connection) => {print(connection)})
    
    
### Links
- [Main](../)