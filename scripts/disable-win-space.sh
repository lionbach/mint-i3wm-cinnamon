#!/bin/bash

array_text=(
"You must perform the following settings manually"
""
"Keyboard settings will open"
"a) Go to the tab: Distributions (upper part)"
"b) Then, at the bottom right click on the button: Options..."
"a new window will open"
"c) Open the dropdown: Switch to another distribution"
"d) Uncheck: Windows key + space"
""
"Done, you can close and continue with the script"
)
tabla_simple array_text  1 1 1
echo ""

read -p "Press enter to open keyboard settings" test ; echo""
cinnamon-settings keyboard