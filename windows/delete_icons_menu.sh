#!/bin/bash

source ./windows/data.sh

win_delete_icons_menu(){
  menu_msj="Hide app menu icons that are also in system settings?"
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Menu"\
                        1           "Yes"\
                        2           "No"\
                        )
  echo "$opcion"
}