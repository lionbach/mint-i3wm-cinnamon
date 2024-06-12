#!/bin/bash

source ./windows/data.sh
source ./scripts/colors.sh

win_color_menu(){
  menu_msj="Choose Border color.
Theme L
<span bgcolor='$l_aqua'  > Aqua   </span> \
<span bgcolor='$l_blue'  > Blue   </span> \
<span bgcolor='$l_gray'  > Gray   </span> \
<span bgcolor='$l_green' > Green  </span> \
<span bgcolor='$l_orange'> Orange </span> \
<span bgcolor='$l_pink'  > Pink   </span> \
<span bgcolor='$l_purple'> Purple </span> \
<span bgcolor='$l_red'   > Red    </span> \
<span bgcolor='$l_sand'  > Sand   </span> \
<span bgcolor='$l_teal'  > Teal   </span> \
<span bgcolor='$l_brown' > Brown  </span> \
<span bgcolor='$l_yellow'> Yellow </span>
<span bgcolor='$y_aqua'  > Aqua   </span> \
<span bgcolor='$y_blue'  > Blue   </span> \
<span bgcolor='$y_gray'  > Gray   </span> \
<span bgcolor='$y_green' > Green  </span> \
<span bgcolor='$y_orange'> Orange </span> \
<span bgcolor='$y_pink'  > Pink   </span> \
<span bgcolor='$y_purple'> Purple </span> \
<span bgcolor='$y_red'   > Red    </span> \
<span bgcolor='$y_sand'  > Sand   </span> \
<span bgcolor='$y_teal'  > Teal   </span> \
<span bgcolor='$y_cyan'  > Cyan   </span> \
<span bgcolor='$y_navy'  > Navy   </span> \
<span bgcolor='$y_yaru'  > Yaru   </span>
Theme Y
"
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Color"\
                        "l_aqua"    "L aqua"\
                        "l_blue"    "L blue"\
                        "l_brown"   "L brown"\
                        "l_gray"    "L gray"\
                        "l_green"   "L green"\
                        "l_orange"  "L orange"\
                        "l_pink"    "L pink"\
                        "l_purple"  "L purple"\
                        "l_red"     "L red"\
                        "l_sand"    "L sand"\
                        "l_teal"    "L teal"\
                        "l_yellow"  "L yellow"\
                        "y_aqua"    "Y Aqua"\
                        "y_blue"    "Y Blue"\
                        "y_cyan"    "Y Cyan"\
                        "y_gray"    "Y Gray"\
                        "y_green"   "Y Green"\
                        "y_navy"    "Y Navy"\
                        "y_orange"  "Y Orange"\
                        "y_pink"    "Y Pink"\
                        "y_purple"  "Y Purple"\
                        "y_red"     "Y Red"\
                        "y_sand"    "Y Sand"\
                        "y_teal"    "Y Teal"\
                        "y_yaru"    "Y Yaru"\
                        )
  echo "$opcion"
}
