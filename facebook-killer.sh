#!/bin/bash
add=0
while test $# -gt 0; do
	case $1 in
		-s)
			shift
			add=1
		;;
	esac
done


dialog --title "Facebook Killer" --msgbox "This program was built for PackHacks2018" 20 80

user=$(dialog --title "Facebook Killer" --inputbox "Enter the username you want to mess with" 20 80 3>&1 1>&2 2>&3 3>&1)

pass=$(dialog --title "Facebook Killer" --passwordbox "Enter the password that goes with the username you want to mess with" 20 80 3>&1 1>&2 2>&3 3>&1)

#if [$add -eq 1]
#then
bash ./scrape.sh $user:$pass
#fi

num=$(dialog --title "Facebook Killer" --inputbox "Enter the number of times you would like the script to run. Larger numbers are better for affecting the algorithm but will take longer" 20 80 3>&1 1>&2 2>&3 3>&1)

dialog --title "Facebook Killer" --infobox "The program is now messing with the algorithms of facebook. Please be patient..." 20 80

for i in `seq 1 $num`; do
casperjs Pacifier.js --user=$user --pass=$pass > /dev/null;
done

dialog --title "Facebook Killer" --msgbox "The algorithm has been messed with. Thank you for your patience." 20 80

clear
