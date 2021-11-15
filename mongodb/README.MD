# MongoDB

## Generate key

```bash
openssl rand -base64 756 > mongo.key
sudo chmod 400 mongo.key
sudo chown 999 mongo.key
```

## Start MongoDB

`docker compose up -d`

## Init replica set

```bash
docker exec -it mongodb1 /bin/sh
```

```mongosh
rs.initiate( {
   _id : "power-rs",
   members: [
      { _id: 0, host: "host.docker.internal:27017" },
      { _id: 1, host: "host.docker.internal:27018" },
      { _id: 2, host: "host.docker.internal:27019" }
   ]
})
```

## add root user

```mongosh
admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: "root",
    pwd: passwordPrompt(),
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
```

## add cluster admin

```mongosh
db.getSiblingDB("admin").createUser(
  {
    "user" : "admin",
    "pwd" : passwordPrompt(),
    roles: [ { "role" : "clusterAdmin", "db" : "admin" } ]
  }
)
```

## add normal user

```mongosh
use admin
db.createUser(
  {
    user: "some_user",
    pwd: "YOUR_LONG_PASSWORD",
    roles:
    [
      { role: "readWrite", db: "some_db" }
    ],
  }
)
```
