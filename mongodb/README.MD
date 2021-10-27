# MongoDB

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
      { role: "readWrite", db: "strapi_db" }
    ],
  }
)
```
