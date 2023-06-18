#!/bin/bash

# Funciones:
# Para boleanos 1 es true.
#
#
# Nombre          Parametros
#
# linea_simple    ancho_total caracter_para_borde texto
# linea_doble     ancho_total caracter_para_borde texto1 texto2 caracter_para_separador_del_medio
# linea_cierre    ancho_total caracter_para_borde
# tabla_simple    array_textos boolean_margen_superior boolean_margen_inferior boolean_linea_de_margen
# tabla_doble     array_textos boolean_margen_superior boolean_margen_inferior boolean_linea_de_margen
#
#
# Ejemplo de uso.
#
#texto_array=(
#"[*] a) Pizza"
#"[ ] b) Pescado de mar"
#"[ ] c) Ravioles"
#)
#tabla_simple texto_array 1 0 1
#tabla_doble texto_array 1 1 1


linea_simple(){
IFS='%'
local ancho_total=$1
local borde=$2
local texto1=$3

texto1=${texto1:0:ancho_total-4}
while [[ ${#texto1} -lt $ancho_total-4 ]]; do
  texto1="$texto1 "
done
texto1="$borde $texto1 $borde"
echo "$texto1"

unset IFS
}

linea_doble(){
IFS='%'
local ancho_tot=$1
local borde=$2
local texto1=$3
local texto2=$4
local separador=$5

local col1=$(($((ancho_tot-7))/2))
local col2=$(($ancho_tot-7-$col1))
texto1=${texto1:0:col1}
texto2=${texto2:0:col2}

while [[ ${#texto1} -lt $col1 ]]; do
  texto1="$texto1 "
done
while [[ ${#texto2} -lt $col2 ]]; do
  texto2="$texto2 "
done
texto1="$borde $texto1 $separador $texto2 $borde"
echo $texto1

unset IFS
}

linea_cierre(){
IFS='%'
local ancho_total=$1
local borde=$2
local linea=""
local i=0
for (( i=1; i<=ancho_total; i++ ))
do
  linea="$borde$linea"
done
echo "$linea"

unset IFS
}

tabla_simple(){
IFS='%'

declare -n local textos="$1"
local cierre_sup=$2
local cierre_inf=$3
local margen=$4
local ancho_total=$(tput cols)
local i=0

if [[ $ancho_total -gt 80 ]]; then
  ancho_total=80
fi

if [[ $cierre_sup -eq 1 ]]; then
  linea_cierre $ancho_total "█"
fi

if [[ $margen -eq 1 ]]; then
  linea_simple $ancho_total "█" ""
fi

for i in "${textos[@]}"
do
  linea_simple $ancho_total "█" "$i"
done

if [[ $margen -eq 1 ]]; then
  linea_simple $ancho_total "█" ""
fi

if [[ $cierre_inf -eq 1 ]]; then
  linea_cierre $ancho_total "█"
fi

unset IFS
}

tabla_doble(){
IFS='%'

declare -n local textos="$1"
local cierre_sup=$2
local cierre_inf=$3
local margen=$4
local ancho_total=$(tput cols)
local i=0

local renglones=${#textos[@]}
if [[ $((renglones%2)) -ne 0 ]]; then
  renglones=$(($renglones+1))
fi
renglones=$((renglones/2))

if [[ $ancho_total -gt 80 ]]; then
  ancho_total=80
fi

if [[ $cierre_sup -eq 1 ]]; then
  linea_cierre $ancho_total "█"
fi

if [[ $margen -eq 1 ]]; then
  linea_doble ancho_total "█" "" "" "█"
fi

for (( i=0; i<=renglones-1; i++ ))
do
  if [[ $((i+renglones)) -lt ${#textos[@]} ]]; then
    linea_doble ancho_total "█" "${textos[$i]}" "${textos[$i+$renglones]}" "█"
  else
    linea_doble ancho_total "█" "${textos[$i]}" "" "█"
  fi
done

if [[ $margen -eq 1 ]]; then
  linea_doble ancho_total "█" "" "" "█"
fi

if [[ $cierre_inf -eq 1 ]]; then
  linea_cierre $ancho_total "█"
fi

unset IFS
}
