#!/bin/sh
id=$(sbot whoami | grep id | awk -F "\"" '{print $4}' | sed 's/.ed25519//' | sed 's/@//')
while true; do
    for int in $(ls -1Atu /sys/class/net ); do
        ip=$(ip addr show $int | grep -v inet6 | grep -v '127.0.0.1' |grep inet | head -n 1 | awk '{print $2}' | awk -F "/" '{print $1}')
        if ! [ -z "$ip" ]; then
            echo -n "net:$ip:8008~shs:$id" |  socat -T 1 - UDP4-DATAGRAM:255.255.255.255:8008,broadcast,so-bindtodevice=$int &
        fi
    done
    sleep 15
done
