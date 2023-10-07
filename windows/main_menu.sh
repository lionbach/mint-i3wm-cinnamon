#!/bin/bash

source ./windows/data.sh

win_main_menu(){
  menu_msj="Select the operation to execute."
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Menu"\
                        1           "Install"\
                        2           "Change theme"\
                        3           "Delete programs"\
                        )
  echo "$opcion"
}