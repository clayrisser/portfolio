#!/bin/sh

/usr/sbin/nginx
echo listening on port 4000
tail -f /var/log/nginx/access.log
