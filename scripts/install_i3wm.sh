#!/bin/bash

array_text=("Update system")
tabla_simple array_text  1 1 1
echo ""

sudo apt update
sudo apt upgrade -y

array_text=("Add repository i3")
tabla_simple array_text  1 1 1
echo ""

/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install -y ./keyring.deb
rm keyring.deb
echo "deb http://debian.sur5r.net/i3/ jammy universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update

array_text=("Install i3-wm rofi")
tabla_simple array_text  1 1 1
echo ""

sudo apt install -y i3-wm rofi

array_text=("Install fonts for i3status (awesome 6.4 and LionEnds)")
tabla_simple array_text  1 1 1
echo ""

sudo mkdir -p /usr/local/share/fonts/
wget -O fontAwesome.zip https://use.fontawesome.com/releases/v6.4.0/fontawesome-free-6.4.0-desktop.zip
unzip fontAwesome.zip
sudo mv fontawesome-free-6.4.0-desktop/ /usr/local/share/fonts/

sudo cp extra_files/LionEnds.ttf /usr/local/share/fonts