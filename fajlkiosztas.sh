#!/bin/bash

fajl=`zenity --file-selection --title="Válaszd ki a fájlt"`

case $? in
	0) zenity --question --text="Ki akarod osztani a(z) \n\n $fajl \n\n fájlt?\n\n A másolás befejezéséig várjon türelemmel!";;
	1) zenity --error --text="Nincs fájl kiválasztva!";;
	-1) zenity --error --text="Váratlan hiba történt. Kapj el egy reumás mókust!" ;;
esac	
	#echo $fajl

for i in {214..220}
do
sshpass -p '12345' scp -P 22 $fajl rgazda@10.111.4.$i:~/ssh/ 2>/dev/null 
done


zenity --info --text="A(z) \n\n $fajl \n\n fájl kiosztása befejeződött.\n\n A tanulók KIOSZTAS mappájában található."
