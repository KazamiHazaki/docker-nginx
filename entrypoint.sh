#!/bin/sh
set -e

php-fpm83 -D
nginx -g "daemon off;"
