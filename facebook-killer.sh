#!/bin/bash

dialog --title "Facebook Killer" --msgbox "This program was built for PackHacks2018" 20 80

user=$(dialog --title "Facebook Killer" --inputbox "Enter the username you want to mess with" 20 80 3>&1 1>&2 2>&3 3>&1)

pass=$(dialog --title "Facebook Killer" --passwordbox "Enter the password that goes with the username you want to mess with" 20 80 3>&1 1>&2 2>&3 3>&1)

dialog --title "Facebook Killer" --infobox "The program is now messing with the algorithms of facebook. Please be patient..." 20 80

casperjs killer2.js --user=$user --pass=$pass > tmp &
dialog --tailbox tmp 20 80

dialog --title "Facebook Killer" --msgbox "The algorithm has been messed with. Thank you for your patience." 20 80
clear
