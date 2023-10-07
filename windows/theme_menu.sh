#!/bin/bash

source ./windows/data.sh
source ./scripts/colors.sh

win_style_menu(){
  menu_msj="Choose Color Palette."
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Color Palette"\
                        "mint_l"    "Mint L"\
                        "mint_y"    "Mint Y"\
                        )
  echo "$opcion"
}

win_appearance_menu(){
  menu_msj="Choose Appearance."
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Appearance"\
                        "light"     "Light"\
                        "dark"      "Dark"\
                        )
  echo "$opcion"
}

win_color_menu_l(){
  menu_msj="Choose color.
<span bgcolor='$l_aqua' color='$l_aqua_b'> Aqua </span> \
<span bgcolor='$l_blue' color='$l_blue_b'> Blue </span> \
<span bgcolor='$l_brown' color='$l_brown_b'> Brown </span> \
<span bgcolor='$l_gray' color='$l_gray_b'> Gray </span> \
<span bgcolor='$l_green' color='$l_green_b'> Green </span> \
<span bgcolor='$l_orange' color='$l_orange_b'> Orange </span> \
<span bgcolor='$l_pink' color='$l_pink_b'> Pink </span> \
<span bgcolor='$l_purple' color='$l_purple_b'> Purple </span> \
<span bgcolor='$l_red' color='$l_red_b'> Red </span> \
<span bgcolor='$l_sand' color='$l_sand_b'> Sand </span> \
<span bgcolor='$l_teal' color='$l_teal_b'> Teal </span> \
<span bgcolor='$l_yellow' color='$l_yellow_b'> Yellow </span> \
"
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Color"\
                        "l_aqua"    "aqua"\
                        "l_blue"    "blue"\
                        "l_brown"   "brown"\
                        "l_gray"    "gray"\
                        "l_green"   "green"\
                        "l_orange"  "orange"\
                        "l_pink"    "pink"\
                        "l_purple"  "purple"\
                        "l_red"     "red"\
                        "l_sand"    "sand"\
                        "l_teal"    "teal"\
                        "l_yellow"  "yellow"\
                        )
  echo "$opcion"
}

win_color_menu_y(){
  menu_msj="Choose color.
<span bgcolor='$y_aqua' color='$y_aqua_b'> Aqua </span> \
<span bgcolor='$y_blue' color='$y_blue_b'> Blue </span> \
<span bgcolor='$y_cyan' color='$y_cyan_b'> Cyan </span> \
<span bgcolor='$y_gray' color='$y_gray_b'> Gray </span> \
<span bgcolor='$y_green' color='$y_green_b'> Green </span> \
<span bgcolor='$y_navy' color='$y_navy_b'> Navy </span> \
<span bgcolor='$y_orange' color='$y_orange_b'> Orange </span> \
<span bgcolor='$y_pink' color='$y_pink_b'> Pink </span> \
<span bgcolor='$y_purple' color='$y_purple_b'> Purple </span> \
<span bgcolor='$y_red' color='$y_red_b'> Red </span> \
<span bgcolor='$y_sand' color='$y_sand_b'> Sand </span> \
<span bgcolor='$y_teal' color='$y_teal_b'> Teal </span> \
<span bgcolor='$y_yaru' color='$y_yaru_b'> Yaru </span> \
"
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Color"\
                        "y_aqua"    "Aqua"\
                        "y_blue"    "Blue"\
                        "y_cyan"    "Cyan"\
                        "y_gray"    "Gray"\
                        "y_green"   "Green"\
                        "y_navy"    "Navy"\
                        "y_orange"  "Orange"\
                        "y_pink"    "Pink"\
                        "y_purple"  "Purple"\
                        "y_red"     "Red"\
                        "y_sand"    "Sand"\
                        "y_teal"    "Teal"\
                        "y_yaru"    "Yaru"\
                        )
  echo "$opcion"
}

win_status_form_menu(){
  menu_msj="Select shape of status indicators."
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Shape"\
                        "arrow"     "Arrow"\
                        "rectangle"      "Rectangle"\
                        )
  echo "$opcion"
}

win_status_style_menu(){
  menu_msj="Select style of status indicators."
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --hide-column=1\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column=""     --column="Appearance"\
                        "nocolor"       "No color"\
                        "bgcolor"       "Background color"\
                        "txtcolor"      "Text color"\
                        "bgmulticolor"  "Background multi-color"\
                        "txtmulticolor" "Text multi-color"\
                        )
  echo "$opcion"
}

