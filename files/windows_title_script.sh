#!/bin/bash

while [ true ]; do
  active_window_id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
  active_window_title=$(xprop -id $active_window_id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
  if [[ ${#active_window_title} -gt 60 ]]; then
    active_window_title="${active_window_title:0:29}...${active_window_title:(-28)}"
  fi
  echo $active_window_title > ~/.config/i3status/windows_title 
  sleep 1
done
