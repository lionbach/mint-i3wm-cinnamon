#!/bin/bash

source ./windows/data.sh

win_delete_software_menu(){
  menu_msj="Select the software to remove."
  local opcion=$(zenity --title="$win_title"\
                        --width=$win_width\
                        --height=$win_height\
                        --list\
                        --checklist\
                        --separator=" "\
                        --print-column=3\
                        --hide-column=3\
                        --text="<span size='12pt'>$menu_msj</span>"\
                        --column="" --column="Name"      --column="Packages"\
                        false       "Calculator"           "gnome-calculator"\
                        false       "Celluloid"            "celluloid"\
                        false       "Character Map"        "gucharmap"\
                        false       "Disk usage analyzer"  "baobab"\
                        false       "Drawing"              "drawing"\
                        false       "Document Scanner"     "simple-scan"\
                        false       "Fonts"                "gnome-font-viewer"\
                        false       "Gnome-Power-Manager"  "gnome-power-manager"\
                        false       "HexChat"              "hexchat"\
                        false       "Hypnotix"             "hypnotix"\
                        false       "Library"              "thingy"\
                        false       "Libre Office"          "libreoffice-* libmythes-1.2-0 mythes-* liblibreoffice-java hunspell hunspell-* ure ure-java python3-uno uno-libs-private hyphen-* libuno-cppu3 libuno-cppuhelpergcc3-3 libunoloader-java libuno-purpenvhelpergcc3-3 libuno-sal3 libuno-salhelpergcc3-3"\
                        false       "Notes"                "sticky"\
                        false       "Onboard"              "onboard"\
                        false       "Passwords and Keys"   "seahorse"\
                        false       "Pix"                  "pix pix-dbg"\
                        false       "Redshift"             "redshift-gtk"\
                        false       "Rhythmbox"            "librhythmbox-core10 rhythmbox rhythmbox-*"\
                        false       "Thunderbird"          "thunderbird thunderbird-gnome-support thunderbird-locale-*"\
                        false       "Transmission"         "transmission-gtk"\
                        false       "Warpinator"           "warpinator"\
                        )
  echo "$opcion"
}