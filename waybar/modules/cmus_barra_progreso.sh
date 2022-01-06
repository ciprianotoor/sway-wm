#!/usr/bin/env bash
#Imprima una barra de progreso para la canción que se está reproduciendo actualmente en cmus

# Longitud de la barra de progreso
# La longitud predeterminada es 50, pero anulada por $ 1
length=${1:-"50"}

# Analizar el mensaje de estado de cmus, extrayendo los segundos reproducidos y los segundos totales
cmusstatus=$(cmus-remote -Q)
duration=$(echo "$cmusstatus" | grep duration | cut -d' ' -f2)
position=$(echo "$cmusstatus" | grep position | cut -d' ' -f2)

# Salga si ambas variables están vacías, es decir, si cmus no se está ejecutando
[[ -z "$duration" ]] && [[ -z "$position" ]] && exit 1

# Calcule cuántos caracteres de la barra de progreso han pasado
past=$(printf "%d * %d / %d\n" $length $position $duration | bc -l | cut -d'.' -f1)

# Establezca pasado en 0 si está vacío porque bc escribe '.25' en lugar de '0.25', por lo que
# si el porcentaje está entre 0 y 1, terminamos con una cadena vacía
# al aplicar la 'función de piso' anterior
[[ -z "$past" ]] && past=0

exec progress $past $length
