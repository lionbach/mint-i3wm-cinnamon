#!/bin/bash

array_text=("Install i3-cinnamon" "from https://github.com/jthomaschewski/i3-cinnamon")
tabla_simple array_text  1 1 1

wget https://github.com/jthomaschewski/i3-cinnamon/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
cd i3-cinnamon-master
sudo make install
cd ..
rm -r i3-cinnamon-master