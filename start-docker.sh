#!/bin/bash
function fix_permissions() {
    sleep 1
    echo Fixing Permissions
    mv /root/.ssb /var/lib/ssb
    chmod a+rwX /var/lib/ssb
    chmod -R a+rwX /var/lib/ssb
    ln -s /.ssb /root/.ssb
    ln -s /var/lib/ssb /.ssb
    exit 0
}
php-fpm5
nginx
fix_permissions &
echo Starting SBOT
sbot server 
