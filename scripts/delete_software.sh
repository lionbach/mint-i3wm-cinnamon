#!/bin/bash

source ./windows/delete_software_menu.sh
source ./windows/delete_icons_menu.sh
source ./windows/password.sh

delete_software=$(win_delete_software_menu)
delete_icons=$(win_delete_icons_menu)

if [[ $delete_software != "" ]]; then
  # actualizando
  win_password | sudo -S apt update
  sudo apt remove -y $delete_software
  sudo apt autoremove
  sudo apt update
fi

hide_app_icon(){
  local app_patron=$1
  mkdir -p ~/.local/share/applications
  cp /usr/share/applications/$app_patron* ~/.local/share/applications/

  local text_files=$(ls ~/.local/share/applications/ | grep $app_patron)
  local array_files=($text_files)

  local i=0

  for i in "${array_files[@]}"
  do
    echo "NoDisplay=true" >> ~/.local/share/applications/$i
  done
}

if [[ $delete_icons == "1" ]]; then
  hide_app_icon "cinnamon-settings-*"
  hide_app_icon "cinnamon-display-panel.desktop"
  hide_app_icon "cinnamon-color-panel.desktop"
  hide_app_icon "cinnamon-network-panel.desktop"
  hide_app_icon "cinnamon-onscreen-keyboard.desktop"
  hide_app_icon "cinnamon-wacom-panel.desktop"
  hide_app_icon "lightdm-settings.desktop"
  hide_app_icon "mintsources.desktop"
  hide_app_icon "blueman-manager.desktop"
  hide_app_icon "mintdrivers.desktop"
  hide_app_icon "gufw.desktop"
  hide_app_icon "mintlocale.desktop"
  hide_app_icon "mintlocale-im.desktop"
  hide_app_icon "system-config-printer.desktop"
fi