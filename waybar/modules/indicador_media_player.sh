#!/bin/sh
#script para mostrar tipo de reproductor pendiente

#:$(playerctl -l) ver reproductor 
player_type=$(playerctl -l 2> /dev/null)
if [ "$player_type" = "spotify" ]; then
        echo ""
elif [ "$player_type" = "" ]; then
    echo "chromium"
fi

