#!/bin/bash

source ./windows/password.sh

# actualizando
win_password | sudo -S apt update

# agregando repositorio de i3-wm
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
sudo apt install -y ./keyring.deb
rm keyring.deb
echo "deb http://debian.sur5r.net/i3/ jammy universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update

# instalando i3wm y rofi
# mplayer se usa para reproducir sonio al cambiar el volumen
sudo apt install -y i3-wm rofi mplayer

# agregando fuentes para i3-status
sudo mkdir -p /usr/local/share/fonts/
wget -O fontAwesome.zip https://use.fontawesome.com/releases/v6.4.0/fontawesome-free-6.4.0-desktop.zip
unzip fontAwesome.zip
rm fontAwesome.zip
sudo mv fontawesome-free-6.4.0-desktop/ /usr/local/share/fonts/

# descargando i3-cinnamon https://github.com/jthomaschewski/i3-cinnamon e instalando

wget https://github.com/jthomaschewski/i3-cinnamon/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
cd i3-cinnamon-master
sudo make install
cd ..
rm -r i3-cinnamon-master

# confi for use keys to modify display brightnes
sudo apt install -y brightnessctl
sudo touch /etc/udev/rules.d/90-brightnessctl.rules
echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="leds", RUN+="/bin/chgrp input /sys/class/leds/%k/brightness"
ACTION=="add", SUBSYSTEM=="leds", RUN+="/bin/chmod g+w /sys/class/leds/%k/brightness"' | sudo tee /etc/udev/rules.d/90-brightnessctl.rules
sudo usermod -a -G video $(whoami)