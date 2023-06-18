#!/bin/bash

select_theme(){

# aqua blue brown gray green orange pink purple red sand teal
local config_selected_color_theme
# light dark 
local config_selected_color_mode
# rectangle arrow
local config_status_button_design
# no_color bg_color font_color bg_multi_color font_multi_color
local config_status_button_color_scheme
local selector

# ------------------------------ config_selected_color_theme ------------------------------

echo""
array_text=("Select color for i3wm")
tabla_simple array_text  1 1 1
echo""

IFS='%'
# aqua
printf '\e[38;2;228;228;228m'
printf '\e[48;2;31;158;222m'
printf '1)  aqua            '
printf '\e[0m (default)\n'
# blue
printf '\e[38;2;228;228;228m'
printf '\e[48;2;12;117;222m'
printf '2)  blue            '
printf '\e[0m\n'
# brown
printf '\e[38;2;228;228;228m'
printf '\e[48;2;170;135;106m'
printf '3)  brown           '
printf '\e[0m\n'
# gray
printf '\e[38;2;228;228;228m'
printf '\e[48;2;112;115;122m'
printf '4)  gray            '
printf '\e[0m\n'
# green
printf '\e[38;2;228;228;228m'
printf '\e[48;2;53;168;84m'
printf '5)  green           '
printf '\e[0m\n'
# orange
printf '\e[38;2;228;228;228m'
printf '\e[48;2;255;113;57m'
printf '6)  orange          '
printf '\e[0m\n'
# pink
printf '\e[38;2;228;228;228m'
printf '\e[48;2;229;73;128m'
printf '7)  pink            '
printf '\e[0m\n'
# purple
printf '\e[38;2;228;228;228m'
printf '\e[48;2;140;93;217m'
printf '8)  purple          '
printf '\e[0m\n'
# red
printf '\e[38;2;228;228;228m'
printf '\e[48;2;232;33;39m'
printf '9)  red             '
printf '\e[0m\n'
# sand
printf '\e[38;2;228;228;228m'
printf '\e[48;2;197;160;124m'
printf '10) sand            '
printf '\e[0m\n'
# teal
printf '\e[38;2;228;228;228m'
printf '\e[48;2;25;156;168m'
printf '11) teal            '
printf '\e[0m\n'
unset IFS

echo ""
read -p "Enter number: " selector ; echo""

case $selector in
  1)
    config_selected_color_theme="aqua"
    ;;
  2)
    config_selected_color_theme="blue"
    ;;
  3)
    config_selected_color_theme="brown"
    ;;
  4)
    config_selected_color_theme="gray"
    ;;
  5)
    config_selected_color_theme="green"
    ;;
  6)
    config_selected_color_theme="orange"
    ;;
  7)
    config_selected_color_theme="pink"
    ;;
  8)
    config_selected_color_theme="purple"
    ;;
  9)
    config_selected_color_theme="red"
    ;;
  10)
    config_selected_color_theme="sand"
    ;;
  11)
    config_selected_color_theme="teal"
    ;;
  *)
    config_selected_color_theme="aqua"
    ;;
esac

# ------------------------------ config_selected_color_mode ------------------------------

array_text=(
"Select mode for i3wm"
""
"1) light (default)"
"2) dark"
)
tabla_simple array_text  1 1 1

echo ""
read -p "Enter number: " selector ; echo""

case $selector in
  1)
    config_selected_color_mode="light"
    ;;
  2)
    config_selected_color_mode="dark"
    ;;
  *)
    config_selected_color_mode="light"
    ;;
esac

# ------------------------------ config_status_button_design ------------------------------
  
array_text=(
"Select i3status buttons shape"
""
"1) arrow (default)"
"2) rectangle"
)
tabla_simple array_text  1 1 1

echo ""
read -p "Enter number: " selector ; echo""

case $selector in
  1)
    config_status_button_design="arrow"
    ;;
  2)
    config_status_button_design="rectangle"
    ;;
  *)
    config_status_button_design="arrow"
    ;;
esac

# ------------------------------ config_status_button_color_scheme ------------------------------

# no_color bg_color font_color bg_multi_color font_multi_color
local config_status_button_color_scheme

array_text=(
"Select i3status buttons color scheme"
""
"1) no color"
"2) backgrounds of the same color"
"3) texts of the same color"
"4) backgrounds of different colors (default)"
"5) texts of different colors"
)
tabla_simple array_text  1 1 1

echo ""
read -p "Enter number: " selector ; echo""

case $selector in
  1)
    config_status_button_color_scheme="no_color"
    ;;
  2)
    config_status_button_color_scheme="bg_color"
    ;;
  3)
    config_status_button_color_scheme="font_color"
    ;;
  4)
    config_status_button_color_scheme="bg_multi_color"
    ;;
  5)
    config_status_button_color_scheme="font_multi_color"
    ;;
  *)
    config_status_button_color_scheme="bg_multi_color"
    ;;
esac

echo $config_selected_color_theme $config_selected_color_mode $config_status_button_design $config_status_button_color_scheme

# ------------------------------ generate ------------------------------

cd file_generator/
source "./file_generator.sh"
generate $config_selected_color_theme $config_selected_color_mode $config_status_button_design $config_status_button_color_scheme
cd ..

}

select_theme