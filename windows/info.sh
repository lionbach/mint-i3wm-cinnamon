#!/bin/bash

source ./windows/data.sh

win_info(){
  zenity --title="$win_title"\
         --width=$win_width\
         --height=$win_height\
         --info\
         --text="<span size='12pt'>$1</span>"
}