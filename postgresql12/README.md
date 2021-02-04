# Postgresql

## Installation

- create user `postgres`: `$ useradd postgres`
- set password: `$ passwd postgres`
- assign user `postgres` to group `postgres`: `$ groupadd -aG postgres`
- inspect postgres uid and guid: `$ cat /etc/passwd`

```bash
...
admin:x:1001:1001::/home/admin:/bin/bash
dockerroot:x:987:981:Docker User:/var/lib/docker:/sbin/nologin
cockpit-ws:x:986:980:User for cockpit-ws:/nonexisting:/sbin/nologin
docker:x:1002:1002::/home/docker:/bin/bash
postgres:x:1003:1003::/home/postgres:/bin/bash
...


above sample output, postgres uid: `1003` and guid: `1003`
```

- change `user` property inside `docker-compose.yml`

```code
user: 1003:1003
```

- create `timezone` file to mount into postgres container

```bash
echo "Asia/Jakarta" > /etc/timezone
```

- mount required volumes:

```docker-compose
volumes:
    - /etc/pwd:/etc/pwd:ro
    - /u0/data/timezone:/etc/timezone:ro
    - /etc/localtime:/etc/localtime:ro
    - /u0/data/postgres:/var/lib/postgresql/data
```
