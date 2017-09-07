#!/bin/bash
cd "$(dirname "$0")"

# Dependencies
apt-get update
apt-get install -y \
    libmemcached-dev \

cd /usr/src
wget https://github.com/websupport-sk/pecl-memcache/archive/NON_BLOCKING_IO_php7.zip
unzip NON_BLOCKING_IO_php7.zip
cd pecl-memcache-NON_BLOCKING_IO_php7
/usr/local/php7/bin/phpize
./configure --enable-memcache --with-php-config=/usr/local/php7/bin/php-config

make && make install
