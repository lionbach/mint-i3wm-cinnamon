#/bin/bash

if [[ $1 == "volume+" ]]; then
  vol_value=$(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
  if [[ $vol_value -gt 95 ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
  else
    pactl set-sink-volume @DEFAULT_SINK@ +5%
  fi
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  killall -SIGUSR1 i3status

fi

if [[ $1 == "volume-" ]]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  killall -SIGUSR1 i3status
fi

if [[ $1 == "volume_mute" ]]; then
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  killall -SIGUSR1 i3status
fi

if [[ $1 == "volume_mic_mute" ]]; then
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  killall -SIGUSR1 i3status
fi

if [[ $1 == "brightness+" ]]; then
  brightnessctl set +5%
  brillo=$(brightnessctl get)
  echo $(((brillo+13)*10/255))"0%" >  ~/.config/i3status/brightness_level
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  killall -SIGUSR1 i3status
fi

if [[ $1 == "brightness-" ]]; then
  brightnessctl set 5%-
  brillo=$(brightnessctl get)
  echo $(((brillo+13)*10/255))"0%" >  ~/.config/i3status/brightness_level
  mplayer /usr/share/mint-artwork/sounds/volume.oga
  killall -SIGUSR1 i3status
fi
