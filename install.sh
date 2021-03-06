#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php7/etc/conf.d

# Symlink php-fpm to php7-fpm
ln -s /usr/local/php7/sbin/php-fpm /usr/local/php7/sbin/php7-fpm

# Symlinks for /bin folder
ln -sf /usr/local/php7/bin/php /usr/bin/php
ln -sf /usr/local/php7/bin/php-cgi /usr/bin/php-cgi
ln -sf /usr/local/php7/bin/php-config /usr/bin/php-config
ln -sf /usr/local/php7/bin/phpize /usr/bin/phpize

# Add config files
cp conf/php.ini /usr/local/php7/etc/php.ini
ln -sf /usr/local/php7/etc/php.ini /usr/local/php7/lib/php.ini


cp conf/www.conf /usr/local/php7/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php7/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php7/etc/conf.d/modules.ini

# Add the init script
cp conf/php7-fpm.init /etc/init.d/php7-fpm
chmod +x /etc/init.d/php7-fpm
update-rc.d php7-fpm defaults

# Add memcache
#./extensions/memcached-install.sh

#service php7-fpm start
