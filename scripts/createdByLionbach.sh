#!/bin/bash
IFS='%'

# codigo para
# ▄
# Lower half block
# U+2584 (ctrol + shit + u y despues 2584 y enter)

#printf '\e[<fg_bg>;2;<R>;<G>;<B>m'
# color del frente
#printf '\e[38;2;0;100;100m'
# color del fondo
#printf '\e[48;2;255;255;255m'
#texto
#printf "▄▄▄▄▄\n▄▄▄▄▄"
#restaura color por defecto
#printf '\e[0m'


 row1="                                                      "
 row2="                                                      "
 row3="                                                      "
 row4="    ██  ███  ████  ██  █████ ████ ███    ███  █   █   "
 row5="   █  █ █  █ █    █  █   █   █    █  █   █  █ █   █   "
 row6="   █    ███  ███  ████   █   ███  █  █   ███   ███   "
 row7="   █  █ █ █  █    █  █   █   █    █  █   █  █   █     "
 row8="    ██  █  █ ████ █  █   █   ████ ███    ███    █     "
 row9="                                                      "
row10="                                                      "
row11="                                                      "
row12="                            ██    ████ █████ ██  ██   "
row13="                            ██     ██  ██ ██ ███ ██   "
row14="                            ██     ██  ██ ██ ██████   "
row15="                            ██     ██  ██ ██ ██ ███   "
row16="                            ██     ██  ██ ██ ██  ██   "
row17="                            ██     ██  ██ ██ ██  ██   "
row18="                            ██     ██  ██ ██ ██  ██   "
row19="                            █████ ████ █████ ██  ██   "
row20="                                                      "
row21="                                                      "
row22="                            █████ █████ █████ ██ ██   "
row23="                            ██ ██ ██ ██ ██ ██ ██ ██   "
row24="                            ██ ██ ██ ██ ██    ██ ██   "
row25="                            ████  █████ ██    █████   "
row26="                            ██ ██ ██ ██ ██    ██ ██   "
row27="                            ██ ██ ██ ██ ██    ██ ██   "
row28="                            ██ ██ ██ ██ ██ ██ ██ ██   "
row29="                            ████  ██ ██ █████ ██ ██   "
row30="                                                      "
row31="                                                      "
row32="                                                      "


#trabajamos con las lineas 1 y 2

draw2pixels(){

# $1 pixel superior
# $2 pixel inferior
# $3 color letra
# $4 color fondo

# definimos color superior
if [[ $1 == "█" ]]; then
  printf "\e[48;2;$3m"
else
  printf "\e[48;2;$4m"
fi

# definios color inferior
if [[ $2 == "█" ]]; then
  printf "\e[38;2;$3m"
else
  printf "\e[38;2;$4m"
fi

#texto
printf "▄"
#restaura color por defecto
printf '\e[0m'

}


deltaVertical="0"

draw2lines(){

local lineaSup=$1
local lineaInf=$2
local i=0

local backR
local backG
local backB

printf "  "

((backR=34+deltaVertical))
((backG=153-deltaVertical))
((backB=84+deltaVertical))

local backColor

local frontColor

if [[ $deltaVertical -lt 10 ]]; then
  frontColor="80;80;80"
else
  frontColor="178;186;187"
fi

for ((i=0; i<"${#lineaSup}"; i++ ))
do
  backColor="$backR;$backG;$backB"
  draw2pixels "${lineaSup:i:1}" "${lineaInf:i:1}" "$frontColor" "$backColor"
  ((backR=backR+2))
  ((backG=backG-1))
  ((backB=backB+2))
done

((deltaVertical=deltaVertical+2))

}
printf "\n"
printf "\n"
draw2lines $row1 $row2
printf "\n"
draw2lines $row3 $row4
printf "\n"
draw2lines $row5 $row6
printf "\n"
draw2lines $row7 $row8
printf "\n"
draw2lines $row9 $row10
printf "\n"
draw2lines $row11 $row12
printf "\n"
draw2lines $row13 $row14
printf "\n"
draw2lines $row15 $row16
printf "\n"
draw2lines $row17 $row18
printf "\n"
draw2lines $row19 $row20
printf "\n"
draw2lines $row21 $row22
printf "\n"
draw2lines $row23 $row24
printf "\n"
draw2lines $row25 $row26
printf "\n"
draw2lines $row27 $row28
printf "\n"
draw2lines $row29 $row30
printf "\n"
draw2lines $row31 $row32
printf "\n"
printf "\n"
printf "\n"

sleep 2

unset IFS
