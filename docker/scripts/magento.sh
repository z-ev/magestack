cd /var/www/magestack/
composer config -g http-basic.repo.magento.com [YOUR LOGIN] [YOUR PASSWORD]
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.3 magento
yes '' | pecl install mcrypt channel://pecl.php.net/mcrypt-1.0.4

cd /var/www/magestack/magento/

chmod +x bin/magento

bin/magento setup:install \
--base-url=http://magestack.loc:8280/ \
--db-host=$MYSQL_HOST \
--db-name=magestack \
--db-user=root \
--db-password=root \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--backend-frontname=mage-admin \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--search-engine=elasticsearch7 \
--elasticsearch-host=$ELASTIC_HOST \
--elasticsearch-port=9200

#--cache-backend=redis \
#--cache-backend-redis-port=6379 \
#--cache-backend-redis-server=magestack_redis \
#--cache-backend-password= \
#--cache-backend-redis-db=0 \
#--session-save=redis \
#--session-save-redis-port=6379 \
#--session-save-redis-host=magestack_redis \
#--session-save-redis-log-level=3 \
#--session-save-redis-db=2 \
#--page-cache=redis \
#--page-cache-redis-port=6379 \
#--page-cache-redis-server=magestack_redis \
#--page-cache-redis-db=1

php bin/magento deploy:mode:set developer
php bin/magento set:up
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento module:enable --all
php bin/magento module:disable Magento_TwoFactorAuth

chmod 777 -R /var/www/magestack/magento/