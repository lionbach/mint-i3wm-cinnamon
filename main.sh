#!/bin/bash
#move to file folder
cd "$(dirname $0)"

source ./windows/info.sh
source ./windows/main_menu.sh


win_info "Mint-i3wm-Cinamon

For details:
https://github.com/lionbach/mint-i3wm-cinnamon
"


#menu
main_menu=0
while [[ $main_menu -ne 99 ]]
do
  main_menu=$(win_main_menu)
  case $main_menu in
    1)
      source ./scripts/install.sh
      ;;
    2)
      source ./scripts/theme.sh
      ;;
    3)
      source ./scripts/delete_software.sh
      ;;
    *)
      main_menu=99
      ;;
  esac
done