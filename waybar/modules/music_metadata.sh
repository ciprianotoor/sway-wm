#!/bin/sh
#script para mostrar datos de reproduccion
#:$(playerctl -l) ver reproductor
#Estados de reproductores
player_status=$(playerctl status 2> /dev/null)
status_spotify=$(playerctl -p spotify status)
status_chromium=$(playerctl -p chromium status)
status_vlc=$(playerctl -p vlc status)
status_rhythmbox=$(playerctl -p rhythmbox status)
type_player=$(playerctl -l 2> /dev/null)
#"exec": "playerctl metadata --format '{{uc(playerName)}}:{{emoji(status)}}:{{ duration(position) }} ' --follow",
#metadatas 
        #spotify
        {       mdst=$(playerctl -p spotify metadata xesam:title)
                mdsa=$(playerctl -p spotify metadata xesam:artist)
                mdsal=$(playerctl -p spotify metadata xesam:album)
                
                        status_spotify_play="$mdst $player_status " #contiene solo el titulo
                        status_spotify_paused="$mdst:$mdsa:$mdsal-$player_status" #contiene  el titulo,artista y album
                }
        #general
        {       mdgt=$(playerctl metadata title)
                mdga=$(playerctl metadata artist)
                mdgal=$(playerctl metadata album)
                        status_general_play="$mdgt $player_status" #contiene solo el titulo
                        status_general_paused="$mdgt:$mdga:$mdsal $player_status" #contiene  el titulo,artista y album
        }
#filtro de metadata

        if [ "$status_chromium" = "Playing" ]; then
        
                echo "🌐 $status_general_play" 
                      
        elif [ "$status_chromium" = "Paused" ]; then
        
                echo "🌐$status_general_paused" 
                
        elif [ "$status_vlc" = "Playing" ]; then
        
                echo "🎞️$status_general_play"    
                 
        elif [ "$status_vlc" = "Paused" ]; then
        
                echo "🎞️$status_general_pause" 
                
        elif [ "$status_rhythmbox" = "Playing" ]; then
        
                echo "🎶️$status_general_play" 
                   
        elif [ "$status_rhythmbox" = "Paused" ]; then
        
                echo "🎶️$status_general_pause" 
                
        elif [ "$status_spotify" = "Playing" ]; then
        
                echo "$status_spotify_play" 
                
        elif [ "$status_spotify" = "Paused" ]; then
        
                echo "$status_spotify_paused" 
                
        elif [ "$player_status" = "Stopped" ]; then
        
                echo "Stop"
        fi

