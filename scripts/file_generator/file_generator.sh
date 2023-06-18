#!/bin/bash

generate(){

# aqua blue brown gray green orange pink purple red sand teal
local selected_color_theme=$1
# light dark 
local selected_color_mode=$2
# rectangle arrow
local status_button_design=$3
# no_color bg_color font_color bg_multi_color font_multi_color
local status_button_color_scheme=$4

local color_theme=""
local color_theme_b=""
local color_bar_main=""
local color_bar_sec=""
local color_button_main=""
local color_button_sec=""
local color_text_main=""
local color_text_sec=""
# others colors
local color_text_in_color="#E4E4E4"
local color_urgent="#F04A50"

case $selected_color_theme in
  aqua)
    color_theme="#1F9EDE"
    color_theme_b="#4FCEFF"
    ;;
  blue)
    color_theme="#0C75DE"
    color_theme_b="#3CA5FF"
    ;;
  brown)
    color_theme="#AA876A"
    color_theme_b="#DAB79A"
    ;;
  gray)
    color_theme="#70737A"
    color_theme_b="#A0A3AA"
    ;;
  green)
    color_theme="#35A854"
    color_theme_b="#65D884"
    ;;
  orange)
    color_theme="#FF7139"
    color_theme_b="#FFA169"
    ;;
  pink)
    color_theme="#E54980"
    color_theme_b="#FF79B0"
    ;;
  purple)
    color_theme="#8C5DD9"
    color_theme_b="#BC8DFF"
    ;;
  red)
    color_theme="#E82127"
    color_theme_b="#FF5157"
    ;;
  sand)
    color_theme="#C5A07C"
    color_theme_b="#F5D0AC"
    ;;
  teal)
    color_theme="#199CA8"
    color_theme_b="#49CCD8"
    ;;
  *)
    color_theme="#1F9EDE"
    color_theme_b="#4FCEFF"
    ;;
esac

case $selected_color_mode in
  light)
    color_bar_main="#E7E7E7"
    color_bar_sec="#2E2E2E"
    color_button_main="#C2C2C2"
    color_button_sec="#3C3C3C"
    color_text_main="#303030"
    color_text_sec="#E4E4E4"
    ;;
  dark)
    color_bar_main="#2E2E2E"
    color_bar_sec="#E7E7E7"
    color_button_main="#3C3C3C"
    color_button_sec="#C2C2C2"
    color_text_main="#E4E4E4"
    color_text_sec="#303030"
    ;;
  *)
    color_bar_main="#E7E7E7"
    color_bar_sec="#2E2E2E"
    color_button_main="#C2C2C2"
    color_button_sec="#3C3C3C"
    color_text_main="#303030"
    color_text_sec="#E4E4E4"
    ;;
esac

# generated ~/.config/i3/config

touch generated_files/i3_config
cat i3_config_01 > generated_files/i3_config

echo "# theme color
set \$color_theme       \"$color_theme\"
set \$color_theme_b     \"$color_theme_b\"
# mode light or dark
set \$color_bar_main    \"$color_bar_main\"
set \$color_bar_sec     \"$color_bar_sec\"
set \$color_button_main \"$color_button_main\"
set \$color_button_sec  \"$color_button_sec\"
set \$color_text_main   \"$color_text_main\"
set \$color_text_sec    \"$color_text_sec\"" >> generated_files/i3_config

cat i3_config_02 >> generated_files/i3_config
mkdir -p ~/.config/i3
cp generated_files/i3_config ~/.config/i3/config


# generated ~/.config/i3status/config


local bg01=$color_button_main
local bg02=$color_button_main
local bg03=$color_button_main
local bg04=$color_button_main
local bg05=$color_button_main
local bg06=$color_button_main
local bg07=$color_button_main
local bg08=$color_button_main
local bg09=$color_button_main

local text01=$color_text_main
local text02=$color_text_main
local text03=$color_text_main
local text04=$color_text_main
local text05=$color_text_main
local text06=$color_text_main
local text07=$color_text_main
local text08=$color_text_main
local text09=$color_text_main

case $status_button_color_scheme in
  bg_color)
    bg01=$color_theme
    bg02=$color_theme
    bg03=$color_theme
    bg04=$color_theme
    bg05=$color_theme
    bg06=$color_theme
    bg07=$color_theme
    bg08=$color_theme
    bg09=$color_theme
    text01=$color_text_in_color
    text02=$color_text_in_color
    text03=$color_text_in_color
    text04=$color_text_in_color
    text05=$color_text_in_color
    text06=$color_text_in_color
    text07=$color_text_in_color
    text08=$color_text_in_color
    text09=$color_text_in_color
    ;;
  font_color)
    text01=$color_theme
    text02=$color_theme
    text03=$color_theme
    text04=$color_theme
    text05=$color_theme
    text06=$color_theme
    text07=$color_theme
    text08=$color_theme
    text09=$color_theme
    ;;
  bg_multi_color)
    bg01="#C5A07C"
    bg02="#199CA8"
    bg03="#E54980"
    bg04="#AA876A"
    bg05="#8C5DD9"
    bg06="#1F9EDE"
    bg07="#70737A"
    bg08="#35A854"
    bg09="#FF7139"
    text01=$color_text_in_color
    text02=$color_text_in_color
    text03=$color_text_in_color
    text04=$color_text_in_color
    text05=$color_text_in_color
    text06=$color_text_in_color
    text07=$color_text_in_color
    text08=$color_text_in_color
    text09=$color_text_in_color
    ;;
  font_multi_color)
    text01="#C5A07C"
    text02="#199CA8"
    text03="#E54980"
    text04="#AA876A"
    text05="#8C5DD9"
    text06="#1F9EDE"
    text07="#70737A"
    text08="#35A854"
    text09="#FF7139"
    ;;
esac

touch generated_files/i3status_config
cat i3status_config_01 > generated_files/i3status_config


if [[ $status_button_design == "arrow" ]]; then

echo "

wireless _first_ {
  format_up = \"<span color='$bg01' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg01' color='$text01'>  %ip - %quality at %essid </span><span bgcolor='$bg01' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  format_down = \"\"
}

ethernet _first_ {
  format_up = \"<span color='$bg02' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg02' color='$text02'>  %ip </span><span bgcolor='$bg02' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  format_down = \"\"
}

cpu_usage {
  format = \"<span color='$bg03' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg03' color='$text03'>     %usage   </span><span bgcolor='$bg03' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
}

memory {
  format = \"<span color='$bg04' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg04' color='$text04'>    %percentage_used  </span><span bgcolor='$bg04' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  threshold_degraded = \"1G\"
  format_degraded = \"MEMORY < %available\" 
}

disk \"/\" {
  format = \"<span color='$bg05' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg05' color='$text05'>    %percentage_used  </span><span bgcolor='$bg05' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
}

volume master {
  format = \"<span color='$bg06' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg06' color='$text06'>   <span font='Font Awesome 6 Free Regular'></span> %volume   </span><span bgcolor='$bg06' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  device = \"pulse\"
}

battery all {
  format = \"\" 
  status_chr = \"<span color='$bg07' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg07' color='$text07'>    %percentage   </span><span bgcolor='$bg07' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  status_bat = \"<span color='$bg07' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg07' color='$text07'>    %percentage   </span><span bgcolor='$bg07' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  status_unk = \"<span color='$bg07' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg07' color='$text07'>  ? %percentage   </span><span bgcolor='$bg07' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  status_full = \"<span color='$bg07' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg07' color='$text07'>    %percentage   </span><span bgcolor='$bg07' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
  format_down = \"\"
  integer_battery_capacity = true
}

tztime date {
  format = \"<span color='$bg08' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg08' color='$text08'>   %d %b  </span><span bgcolor='$bg08' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
}

tztime hour {
  format = \"<span color='$bg09' font='LionEnds Bold 12'>Y</span><span bgcolor='$bg09' color='$text09'>    %H:%M  </span><span bgcolor='$bg09' color='$color_bar_main' font='LionEnds Bold 12'>Y</span>\"
}" >> generated_files/i3status_config

else

echo "

wireless _first_ {
  format_up = \"<span bgcolor='$bg01' color='$text01'>  %ip - %quality at %essid </span>\"
  format_down = \"\"
}

ethernet _first_ {
  format_up = \"<span bgcolor='$bg02' color='$text02'>  %ip </span>\"
  format_down = \"\"
}

cpu_usage {
  format = \"<span bgcolor='$bg03' color='$text03'>     %usage   </span>\"
}

memory {
  format = \"<span bgcolor='$bg04' color='$text04'>    %percentage_used  </span>\"
  threshold_degraded = \"1G\"
  format_degraded = \"MEMORY < %available\" 
}

disk \"/\" {
  format = \"<span bgcolor='$bg05' color='$text05'>    %percentage_used  </span>\"
}

volume master {
  format = \"<span bgcolor='$bg06' color='$text06'>   <span font='Font Awesome 6 Free Regular'></span> %volume   </span>\"
  device = \"pulse\"
}

battery all {
  format = \"\" 
  status_chr = \"<span bgcolor='$bg07' color='$text07'>    %percentage   </span>\"
  status_bat = \"<span bgcolor='$bg07' color='$text07'>    %percentage   </span>\"
  status_unk = \"<span bgcolor='$bg07' color='$text07'>  ? %percentage   </span>\"
  status_full = \"<span bgcolor='$bg07' color='$text07'>    %percentage   </span>\"
  format_down = \"\"
  integer_battery_capacity = true
}

tztime date {
  format = \"<span bgcolor='$bg08' color='$text08'>   %d %b  </span>\"
}

tztime hour {
  format = \"<span bgcolor='$bg09' color='$text09'>    %H:%M  </span>\"
}" >> generated_files/i3status_config

fi
mkdir -p ~/.config/i3status
cp generated_files/i3status_config ~/.config/i3status/config


# generated ~/.config/rofi/config.rasi


mkdir -p ~/.config/rofi
cp rofi_config.rasi ~/.config/rofi/config.rasi


# generated ~/.config/rofi/theme.rasi


touch generated_files/rofi_theme
cat rofi_theme_01 > generated_files/rofi_theme

if [[ $selected_color_mode == "dark" ]]; then
  echo "
  bar-main: #2E2E2E;
  bar-sec: #E7E7E7;
  button-main: #3C3C3C;
  button-sec: #C2C2C2;
  text-main: #E4E4E4;
  text-sec: #303030;
  " >> generated_files/rofi_theme
else
  echo "
  bar-main: #E7E7E7;
  bar-sec: #2E2E2E;
  button-main: #C2C2C2;
  button-sec: #3C3C3C;
  text-main: #303030;
  text-sec: #E4E4E4;
  " >> generated_files/rofi_theme
fi

echo "  enfasis: @"$selected_color_theme";" >> generated_files/rofi_theme
cat rofi_theme_02 >> generated_files/rofi_theme
cp generated_files/rofi_theme ~/.config/rofi/theme.rasi

}