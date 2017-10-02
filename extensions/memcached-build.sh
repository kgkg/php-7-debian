#!/bin/bash
cd "$(dirname "$0")"

# Dependencies
wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
tar zvxf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18
./configure
make
make install

cd ..
git clone https://github.com/php-memcached-dev/php-memcached
cd php-memcached
git fetch --tags --prune
TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
git checkout -f tags/$TAG
git reset --hard
phpize
./configure --with-libmemcached-dir=/usr/local
make
make install
