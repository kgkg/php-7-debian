#!/bin/bash

# Enable the module
echo "extension=memcached.so" | tee -a /usr/local/php7/etc/conf.d/modules.ini
