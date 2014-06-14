#! /bin/bash

route add default gw 192.168.25.1
route del default gw 192.168.0.202

x=`grep "192.168.0.202" /etc/resolv.conf | wc -l`
if [ "$x" -eq "0" ]
then
	echo "nameserver 192.168.0.202" | cat - /etc/resolv.conf > /tmp/out && mv /tmp/out /etc/resolv.conf
fi

service openvpn restart
