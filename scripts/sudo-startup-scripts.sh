#! /bin/bash

route add default gw 192.168.25.1
route del default gw 192.168.0.202

# EDIT resolv.conf

service openvpn restart
