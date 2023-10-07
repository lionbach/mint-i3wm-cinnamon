#!/bin/bash

source ./windows/password.sh

# actualizando
win_password | sudo -S apt update

# agregando repositorio de i3-wm
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install -y ./keyring.deb
rm keyring.deb
echo "deb http://debian.sur5r.net/i3/ jammy universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update

# instalando i3wm y rofi
sudo apt install -y i3-wm rofi

# agregando fuentes para i3-status
sudo mkdir -p /usr/local/share/fonts/
wget -O fontAwesome.zip https://use.fontawesome.com/releases/v6.4.0/fontawesome-free-6.4.0-desktop.zip
unzip fontAwesome.zip
rm fontAwesome.zip
sudo mv fontawesome-free-6.4.0-desktop/ /usr/local/share/fonts/
sudo cp ./files/LionEnds.ttf /usr/local/share/fonts

# descargando i3-cinnamon https://github.com/jthomaschewski/i3-cinnamon e instalando

wget https://github.com/jthomaschewski/i3-cinnamon/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
cd i3-cinnamon-master
sudo make install
cd ..
rm -r i3-cinnamon-master