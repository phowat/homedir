#! /bin/bash

sound=`amixer get Master | grep -o '\[o.*\]'`

amixer set Master toggle  > /dev/null
if [ $sound = "[on]" ];
then 
	pactl set-sink-mute 0 1
	echo "SOUND OFF"
else
	pactl set-sink-mute 0 0
	echo "SOUND ON"
fi
