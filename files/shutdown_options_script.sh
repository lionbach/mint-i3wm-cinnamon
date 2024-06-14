#/bin/bash

shutdown_option=""
confirm_operation=""

shutdown_option=$(zenity --question \
  --title="Shutdown options" \
  --text="<span size='16pt'><b>Shutdown options:</b></span>" \
  --switch \
  --extra-button="Cancel" \
  --extra-button="Change user" \
  --extra-button="Logout" \
  --extra-button="Reboot" \
  --extra-button="Shutdown")

if [[ $shutdown_option != "Cancel" ]] && [[ $shutdown_option != "" ]]; then
  confirm_operation=$(zenity --question \
  --title="$shutdown_option" \
  --text="<span size='16pt'><b>$shutdown_option</b></span>\n Confirm operation?" \
  --width=250 \
  --icon-name="error" \
  --switch \
  --extra-button="No" \
  --extra-button="Yes")
fi

if [[ $confirm_operation = "Yes" ]]; then
  case $shutdown_option in
    "Cancel")
      echo "Cancel"
      ;;
    "Change user")
      #xdm: lxdm -c USER_SWITCH
      #lightdm: dm-tool switch-to-greeter
      #gdm: gdmflexiserver
      #kdm: kdmctl reserve
      dm-tool switch-to-greeter
      ;;
    "Logout")
      i3-msg exit
      ;;
    "Reboot")
      shutdown --reboot now
      ;;
    "Shutdown")
      shutdown now
      ;;
    *)
      echo "error"
      ;;
  esac
fi