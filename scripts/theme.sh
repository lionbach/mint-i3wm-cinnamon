#!/bin/bash

source ./scripts/colors.sh
source ./windows/theme_menu.sh

generateTheme() {

  color01=$l_brown
  color02=$l_teal
  color03=$l_pink
  color04=$l_blue
  color05=$l_purple
  color06=$l_aqua
  color07=$l_gray
  color08=$l_green
  color09=$l_orange

  # Definimos colores

  color_b=$color"_b"
  color_theme=${!color}
  color_theme_b=${!color_b}

  # Definimos light o dark

  if [[ $appearance == "light" ]]; then
    color_bar_main=$bar_light
    color_bar_sec=$bar_dark
    color_button_main=$button_light
    color_button_sec=$button_dark  
  fi
  if [[ $appearance == "dark" ]]; then
    color_bar_main=$bar_dark
    color_bar_sec=$bar_light
    color_button_main=$button_dark
    color_button_sec=$button_light
  fi
  color_text_main=$color_bar_sec
  color_text_sec=$color_bar_main

  #generamos config de i3wm y reemplasamos los valores de los colores

  mkdir -p ~/.config/i3
  cp ./files/template_i3_config ~/.config/i3/config
  sed -i "s/__color_theme__/$color_theme/g" ~/.config/i3/config
  sed -i "s/__color_theme_b__/$color_theme_b/g" ~/.config/i3/config
  sed -i "s/__color_bar_main__/$color_bar_main/g" ~/.config/i3/config
  sed -i "s/__color_bar_sec__/$color_bar_sec/g" ~/.config/i3/config
  sed -i "s/__color_button_main__/$color_button_main/g" ~/.config/i3/config
  sed -i "s/__color_button_sec__/$color_button_sec/g" ~/.config/i3/config
  sed -i "s/__color_text_main__/$color_text_main/g" ~/.config/i3/config
  sed -i "s/__color_text_sec__/$color_text_sec/g" ~/.config/i3/config
  sed -i "s/__color_text_in_color__/$color_text_in_color/g" ~/.config/i3/config
  sed -i "s/__color_urgent__/$color_urgent/g" ~/.config/i3/config

  #generamos config de rofi y reemplasamos los valores de los colores

  mkdir -p ~/.config/rofi
  cp ./files/template_rofi_config.rasi ~/.config/rofi/config.rasi
  cp ./files/template_rofi_theme ~/.config/rofi/theme.rasi
  sed -i "s/__color_theme__/$color_theme/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_theme_b__/$color_theme_b/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_bar_main__/$color_bar_main/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_bar_sec__/$color_bar_sec/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_button_main__/$color_button_main/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_button_sec__/$color_button_sec/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_text_main__/$color_text_main/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_text_sec__/$color_text_sec/g" ~/.config/rofi/theme.rasi
  sed -i "s/__color_text_in_color__/$color_text_in_color/g" ~/.config/rofi/theme.rasi

  #generamos config de i3status y reemplasamos los valores de los colores

  #aca generar los archivos

  mkdir -p ~/.config/i3status
  if [[ $status_form == "arrow" ]]; then  
    cp ./files/template_i3status_arrow ~/.config/i3status/config
  fi
  if [[ $status_form == "rectangle" ]]; then  
    cp ./files/template_i3status_rectangle ~/.config/i3status/config  
  fi

  # i3status con color de fondo

  if [[ $status_style == "bgcolor" ]]; then  
    sed -i "s/__bg01__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg02__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg03__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg04__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg05__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg06__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg07__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg08__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__bg09__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text01__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text02__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text03__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text04__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text05__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text06__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text07__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text08__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text09__/$color_text_in_color/g" ~/.config/i3status/config
  fi

  # i3status con color de letra

  if [[ $status_style == "txtcolor" ]]; then
    sed -i "s/__bg01__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg02__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg03__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg04__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg05__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg06__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg07__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg08__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg09__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__text01__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text02__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text03__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text04__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text05__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text06__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text07__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text08__/$color_theme/g" ~/.config/i3status/config
    sed -i "s/__text09__/$color_theme/g" ~/.config/i3status/config
  fi

  # i3status con multi-color de fondo

  if [[ $status_style == "bgmulticolor" ]]; then  
    sed -i "s/__bg01__/$color01/g" ~/.config/i3status/config
    sed -i "s/__bg02__/$color02/g" ~/.config/i3status/config
    sed -i "s/__bg03__/$color03/g" ~/.config/i3status/config
    sed -i "s/__bg04__/$color04/g" ~/.config/i3status/config
    sed -i "s/__bg05__/$color05/g" ~/.config/i3status/config
    sed -i "s/__bg06__/$color06/g" ~/.config/i3status/config
    sed -i "s/__bg07__/$color07/g" ~/.config/i3status/config
    sed -i "s/__bg08__/$color08/g" ~/.config/i3status/config
    sed -i "s/__bg09__/$color09/g" ~/.config/i3status/config
    sed -i "s/__text01__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text02__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text03__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text04__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text05__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text06__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text07__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text08__/$color_text_in_color/g" ~/.config/i3status/config
    sed -i "s/__text09__/$color_text_in_color/g" ~/.config/i3status/config 
  fi

  # i3status con multi-color de letra

  if [[ $status_style == "txtmulticolor" ]]; then
    sed -i "s/__bg01__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg02__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg03__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg04__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg05__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg06__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg07__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg08__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__bg09__/$color_button_main/g" ~/.config/i3status/config
    sed -i "s/__text01__/$color01/g" ~/.config/i3status/config
    sed -i "s/__text02__/$color02/g" ~/.config/i3status/config
    sed -i "s/__text03__/$color03/g" ~/.config/i3status/config
    sed -i "s/__text04__/$color04/g" ~/.config/i3status/config
    sed -i "s/__text05__/$color05/g" ~/.config/i3status/config
    sed -i "s/__text06__/$color06/g" ~/.config/i3status/config
    sed -i "s/__text07__/$color07/g" ~/.config/i3status/config
    sed -i "s/__text08__/$color08/g" ~/.config/i3status/config
    sed -i "s/__text09__/$color09/g" ~/.config/i3status/config
  fi
  
  # si no es ninguna de los if anteriores, entonces es no-color
  # esto se debe ejecutar siempre, por eso no esta en un if

  sed -i "s/__bg01__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg02__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg03__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg04__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg05__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg06__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg07__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg08__/$color_button_main/g" ~/.config/i3status/config
  sed -i "s/__bg09__/$color_button_main/g" ~/.config/i3status/config

  sed -i "s/__text01__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text02__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text03__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text04__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text05__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text06__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text07__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text08__/$color_text_main/g" ~/.config/i3status/config
  sed -i "s/__text09__/$color_text_main/g" ~/.config/i3status/config

  sed -i "s/__color_bar_main__/$color_bar_main/g" ~/.config/i3status/config
}

#Menus para elegir estilos

style=$(win_style_menu)
cancel=$style

if [[ $cancel != "" ]]; then
  if [[ $style == "mint_l" ]]; then
      color=$(win_color_menu_l)
    fi
    if [[ $style == "mint_y" ]]; then
      color=$(win_color_menu_y)
    fi
  cancel=$color
fi

if [[ $cancel != "" ]]; then
  appearance=$(win_appearance_menu)
  cancel=$appearance
fi

if [[ $cancel != "" ]]; then
  status_form=$(win_status_form_menu)
  cancel=$status_form
fi

if [[ $cancel != "" ]]; then
  status_style=$(win_status_style_menu)
  cancel=$status_style
fi

if [[ $cancel != "" ]]; then
  generateTheme
fi