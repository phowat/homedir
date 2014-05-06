#! /bin/bash

route add default gw 192.168.25.1
route del default gw 192.168.0.202

echo "nameserver 192.168.0.202" | cat - /etc/resolv.conf > /tmp/out && mv /tmp/out /etc/resolv.conf

service openvpn restart
