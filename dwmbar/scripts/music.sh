#!/usr/bin/env bash

pidof -x playerctl-loop >/dev/null 2>&1 || playerctl-loop >/dev/null 2>&1 &


#MUSIC=cmus
MUSIC=termusic
BROWSER=brave-browser

BROWSER_STATUS=$(2>/dev/null playerctl --player=$BROWSER status)
MUSIC_STATUS=$(2>/dev/null playerctl --player=$MUSIC status)
#
#🎵
[[ $MUSIC_STATUS == "Playing" ]] && ICON="❚❚ " || ICON=" ▶ "

if [[ $BROWSER_STATUS == "Playing" ]]; then
    PLAYER=$BROWSER
    ICON="🦊 "
    NORMAL=$(playerctl metadata --player=$PLAYER --format '{{ trunc(title,25) }}')
    ALTERNATE=$(playerctl metadata --player=$PLAYER --format '{{ trunc(artist,17) }} - {{ trunc(title,17) }}')
else
    PLAYER=$MUSIC
    NORMAL=$(playerctl metadata --player=$PLAYER --format '{{ trunc(artist,17) }} - {{ trunc(title,17) }}')
    ALTERNATE=$(playerctl metadata --player=$PLAYER --format '{{ trunc(album,17) }} - {{ trunc(title,17) }}')
fi

FORMAT_FILE="/tmp/dwmblocks_mus_format"
[ ! -f "$FORMAT_FILE" ] && echo "0" > "$FORMAT_FILE"

read FORMAT < "$FORMAT_FILE"

case $BLOCK_BUTTON in
		1) echo "$(( ($FORMAT + 1) % 2 ))" > "$FORMAT_FILE" ;;
		2) playerctl --player=$PLAYER play-pause; pkill -RTMIN+11 "${STATUSBAR:-dwmblocks}" ;;
		3) setsid -w -f "$TERMINAL" -e pulsemixer; pkill -RTMIN+11 "${STATUSBAR:-dwmblocks}" ;;
		4) playerctl --player=$PLAYER volume 0.05+ ;;
		5) playerctl --player=$PLAYER volume 0.05- ;;
		6) setsid -f "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

[ "$FORMAT" -eq 0 ] && INFO="$NORMAL" || INFO="$ALTERNATE"

echo -e "$ICON$INFO"
