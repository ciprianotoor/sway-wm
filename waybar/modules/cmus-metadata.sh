#!/bin/bash
#Filtro de estado
estado=$(cmus-remote -Q 2> /dev/null | grep status | cut -d ' ' -f2-)

#datos
        duracion=$(cmus-remote -Q 2> /dev/null | grep duration | cut -d ' ' -f2-)
        tiempo_actual=$(cmus-remote -Q 2> /dev/null | grep position | cut -d ' ' -f2-)

        #Metadatos 
        artista=$(cmus-remote -Q 2> /dev/null | grep ' artist ' | cut -d ' ' -f3-)
        album=$(cmus-remote -Q 2> /dev/null | grep ' album ' | cut -d ' ' -f3-)
        fecha=$(cmus-remote -Q 2> /dev/null | grep ' date ' | cut -d ' ' -f3-)
        cancion=$(cmus-remote -Q 2> /dev/null | grep title | cut -d ' ' -f3-)
        numero_disco=$(cmus-remote -Q 2> /dev/null | grep ' discnumber ' | cut -d ' ' -f3-)
        genero=$(cmus-remote -Q 2> /dev/null | grep ' genre ' | cut -d ' ' -f3-)
        pista_numero=$(cmus-remote -Q 2> /dev/null | grep ' tracknumber ' | cut -d ' ' -f3-)
        volumen=$(cmus-remote -Q 2> /dev/null | grep ' label ' | cut -d ' ' -f3-)
        editora=$(cmus-remote -Q 2> /dev/null | grep ' publisher ' | cut -d ' ' -f3-)
       
        #otros datos
        #ubicacion=$(cmus-remote -C 'echo {}')
        #conversiones:  
          ((minutos=$duracion/60))
          ((segundos=$duracion % 60))
            tiempo_total=$minutos:$segundos
        #tiempos restantes:
                #Minutos restantes:
                
         ((tiempo_restante_minutos=$tiempo_actual/60))
         ((trm= (minutos-$tiempo_restante_minutos))) 
         
                #Segundos restantes:
         ((tiempo_restante_segundos=$tiempo_actual % 60))             
         ((trs= (segundos-$tiempo_restante_segundos)))
          trest=$trm:$trs   
        #tiempos recorridos
        ((tiempo_recorridos_minutos=$minutos-$trm))  
        ((tiempo_recorridos_segundos=$segundos-$trs))
          trecorr=$tiempo_recorridos_minutos:$tiempo_recorridos_segundos
#Condicionales
        if [[ "$estado" = "playing" ]]; then

                echo "cmus:  $estado  $cancion $trest/$trecorr"
               
        elif [[ "$estado" = "paused" ]]; then
        
                echo "cmus: $estado  $artista - $cancion-$album-$fecha-$numero_disco-$genero  $tiempo_total"
       elif [[ "$estado" = "stopped" ]]; then
        
                echo "cmus: Parado"
        fi    
    
   
