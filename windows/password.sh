#!/bin/bash

source ./windows/data.sh

win_password(){
  local opcion=$(zenity --title="$win_title"\
                        --password
                        )
  echo "$opcion"
}
