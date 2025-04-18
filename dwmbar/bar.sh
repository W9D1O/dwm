#!/bin/bash

DIR="$HOME/.config/dwmbar/scripts"
while [[ true ]]; do
  #system="$($DIR/system.sh)"
	fecha_hora="$($DIR/clock.sh)"
  music="$($DIR/music.sh)"
	mem="$($DIR/memoria.sh)"
	wifi_ip=$($DIR/wifi_ip.sh)
	disk_root=$($DIR/disk_root.sh)
	vol=$($DIR/volume.sh)
  clima=$($DIR/clima.sh)
    ip_public="󰩟 :$(curl ifconfig.me)"
	disk_home=$($DIR/disk_home.sh)
	xsetroot -name "$music $disk_root $disk_home $mem  $fecha_hora" 
	sleep 1
done
