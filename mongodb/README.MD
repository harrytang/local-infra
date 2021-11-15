# MongoDB

## Generate key

```bash
openssl rand -base64 756 > mongo.key
sudo chmod 400 mongo.key
sudo chown 999 mongo.key
```

## Start MongoDB

`docker compose up -d`

## Add users

```bash
docker exec -it mongodb-mongodb-1 /bin/sh
```

```sql
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
