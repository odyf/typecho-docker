#!/bin/sh                                                                                                                                                                                       
set -e                                                                                                                                                                                          
mkdir /var/www/html/usr && cp -a /usr/src/typecho/typecho-master/* /var/www/html/                                                                                                                                          
exec "$@" 
