#!/bin/bash

# Enable the module
echo "extension=memcache.so" | tee -a /usr/local/php7/etc/conf.d/modules.ini
