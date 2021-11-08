# detecting ordinal number
ordinal=$(ls /mnt/instances | wc -l)
if [[ "${ordinal}" -lt 3 ]]; then
  touch /mnt/instances/$(hostname);
fi

# start the server
if [[ "${ordinal}" -eq 0 ]] && [[ ! -f /docker-entrypoint-initdb.d/.initialized ]]; then
  echo "starting with option --wsrep-new-cluster"
  touch /docker-entrypoint-initdb.d/.initialized
  /usr/local/bin/docker-entrypoint.sh mysqld --wsrep-new-cluster
else
  echo "starting without option --wsrep-new-cluster"
  /usr/local/bin/docker-entrypoint.sh mysqld
fi