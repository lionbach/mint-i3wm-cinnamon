#!/bin/bash

source "./createdByLionbach.sh"
source "./tablas.sh"

array_text=(
"Script designed to install and configure i3wm on"
"linux mint 21 (cinnamon edition)."
"i3wm will be used together with the cinnamon desktop."
"These settings were made for personal use"
"and are shared without any warranty."
"Use at your own risk."
""
"Thanks to the authors of the following repositories:"
"https://github.com/jthomaschewski/i3-cinnamon"
"https://github.com/ItzSelenux/rofi-mint-themes"
"https://github.com/Galindo-lab/linux-mint-rofi-themes"
"Which were employed to carry out this work."
)

tabla_simple array_text  1 1 1

array_text=(
"Steps to create Linux Mint i3wm-cinnamon"
""
"1) update system"
"2) add i3wm repository"
"3) install i3wm, rofi, fonts for i3status"
"4) install i3-cinnamon"
"   (https://github.com/jthomaschewski/i3-cinnamon)"
"5) generate config files for i3wm, i3status, rofi"
"6) disable win + space combination in cinnamon"
"7) close sesion"
)

tabla_simple array_text  0 1 1

echo ""
read -p "Continue? (y/n) " respuesta ; echo""
if [[ "$respuesta" = "y" ]] || [[ "$respuesta" = "Y" ]]; then
  source "./install_i3wm.sh"
  source "./install_i3-cinnamon.sh"
  source "./config-i3wm-i3status-rofi.sh"
  source "./disable-win-space.sh"

  array_text=(
  "You should now log out and choose the i3 session at the login screen."
  )
  tabla_simple array_text  1 1 1

  read -p "logout now? (y/n) " respuesta ; echo""
  if [[ "$respuesta" = "y" ]] || [[ "$respuesta" = "Y" ]]; then
    sudo pkill -KILL -u $USER
  fi
fi