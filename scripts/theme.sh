#!/bin/bash

source ./scripts/colors.sh
source ./windows/theme_menu.sh

generateTheme() {

  # Definimos colore
  color_theme=${!color}
  # i3wm
  mkdir -p ~/.config/i3
  cp ./files/template_i3_config ~/.config/i3/config
  sed -i "s/__color_theme__/$color_theme/g" ~/.config/i3/config

  # rofi
  mkdir -p ~/.config/rofi
  cp ./files/template_rofi_config.rasi ~/.config/rofi/config.rasi
  cp ./files/template_rofi_theme ~/.config/rofi/theme.rasi
  sed -i "s/__color_theme__/$color_theme/g" ~/.config/rofi/theme.rasi

  # i3status
  mkdir -p ~/.config/i3status
  cp ./files/template_i3status ~/.config/i3status/config  
}

#Menus para elegir estilos

color=$(win_color_menu)
cancel=$color

if [[ $cancel != "" ]]; then
  touch ~/.config/i3/extra_config
  generateTheme
fi
