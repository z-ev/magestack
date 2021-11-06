# magestack
## Docker
```shell script
$ cp .env.docker .env
$ docker-compose up -d --build
```
### Update file of hosts `/etc/hosts` 
```text
...
127.0.0.1 magestack.loc www.magestack.loc
```
### install magento
```shell script
$ docker-compose exec php bash
$ /scripts/magento.sh
```
### Check in browser
http://magestack.loc:8280/

***Admin panel***
http://magestack.loc:8280/mage-admin
***admin:admin123***


## Kubernetes
***(in the process of developing)***
```shell script
kubectl apply -f .kube/loc/cm
kubectl apply -f .kube/loc/deployment
kubectl apply -f .kube/loc/services
```