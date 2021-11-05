# magestack

```shell script
$ cp .env.docker .env
$ docker-compose up -d --build
```
### Update file of hosts `/etc/hosts` 
```text
...
127.0.0.1 magestack.loc www.magestack.loc
```
### Check in browser
http://magestack.loc:8280/test.php