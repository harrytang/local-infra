# MariaDB Galera Cluster local docker

Running

```bash
docker compose up -d
```

To reset, delete the vols and remove all files in ./instances dir

## Creating and adding users/databases

```sql
CREATE USER 'some_user'@'%' IDENTIFIED BY 'SOME_PASSWORD';
CREATE DATABASE some_db;
GRANT ALL PRIVILEGES ON `some_db` . * TO 'some_user'@'%';
```
