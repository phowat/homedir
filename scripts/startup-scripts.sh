#! /bin/bash

xrandr --output HDMI1 --left-of VGA1 --mode 1920x1080
xrandr --output VGA1 --right-of HDMI1 --mode 1680x1050
setxkbmap us -variant intl
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'clear Lock'
xmodmap -e 'add Control = Control_L'
#exec /home/pedro/.dropbox-dist/dropboxd &
#export PATH=$PATH:$HOME/.cabal/bin

DISPLAY=:0 /home/pedro/scripts/background.pl
