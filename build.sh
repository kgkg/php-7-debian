#!/bin/bash
cd "$(dirname "$0")"

# Dependencies
apt-get update
apt-get install -y \
    build-essential \
    pkg-config \
    git-core \
    autoconf \
    bison \
    libxml2-dev \
    libbz2-dev \
    libmcrypt-dev \
    libicu-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libltdl-dev \
    libjpeg-dev \
    libpng-dev \
    libpspell-dev \
    libreadline-dev

git clone -b PHP-7.3.1 --depth=1 https://github.com/php/php-src.git
cd php-src
git checkout PHP-7.3.1
 
./buildconf --force

mv /usr/local/php7 /usr/local/php7_prev
mkdir /usr/local/php7

CONFIGURE_STRING="--prefix=/usr/local/php7 \
                  --enable-huge-code-pages \
                  --with-config-file-scan-dir=/usr/local/php7/etc/conf.d \
                  --without-pear \
                  --enable-bcmath \
                  --with-bz2 \
                  --enable-calendar \
                  --enable-ftp \
                  --with-gettext \
                  --with-gd \
                  --with-jpeg-dir \
                  --with-freetype-dir \
                  --enable-mbstring \
                  --with-mhash \
                  --enable-mysqlnd \
                  --with-mysql=mysqlnd \
                  --with-mysql-sock=/var/run/mysqld/mysqld.sock \
                  --with-mysqli=mysqlnd \
                  --with-pdo-mysql=mysqlnd \
                  --with-openssl \
                  --enable-pcntl \
                  --enable-shmop \
                  --enable-soap \
                  --enable-sockets \
                  --enable-sysvmsg \
                  --enable-sysvsem \
                  --enable-sysvshm \
                  --enable-wddx \
                  --with-zlib \
                  --enable-zip \
                  --with-readline \
                  --with-curl \
                  --enable-fpm \
                  --with-fpm-user=www-data \
                  --with-fpm-group=www-data"

./configure $CONFIGURE_STRING

make -j `cat /proc/cpuinfo | grep processor | wc -l`
make install

cd ../extensions
./memcached-build.sh
