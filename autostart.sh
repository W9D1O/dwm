#!/bin/bash
# This file is for autostart programs
xmodmap -e "pointer = 3 2 1 4 5 6 7 8 9 10"
~/.config/resolucion.sh
lxpolkit &
dunst &
picom &
feh --bg-fill /home/cuelgue/Pictures/haruhara-haruko.jpg
wal -R
#bash startx
#nitrogen --restore &
#volumeicon &
bash ~/.config/dwmbar/bar.sh &
nm-applet
