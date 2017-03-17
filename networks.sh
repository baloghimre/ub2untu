#!/bin/bash
MOUNTED="hamis"
TANAR="hamis"
clear
echo "Készitette Komáromi Richárd."
 sleep 3
#clear

 if [ "-u" = "$1" ]; then
read -p "Felhasználó név: " felh 
sudo umount /media/$felh
sudo umount /media/kozos
sudo umount /media/mindenki
sudo rmdir /media/$felh
	
else

while [  "$MOUNTED" = "hamis" ]; do 


input=$(zenity --text "Kérem add meg a felhasználó neved " --username --password)

IFS='|' read -a myarray <<< "$input"
felh=${myarray[0]}
jelsz=${myarray[1]}

#echo $felh
#echo $jelsz
#read -p "Felhasználó név: " felh 

if grep -q '\.' <<< $felh ; then 
	TANAR="hamis"
	echo "diak lépett be" 
else 
	TANAR="igaz"
echo "tanar lepett be"
fi

#read -p "Jelszó:" -s jelsz

if [ ! -d "/media/kozos" ]; then
 mkdir /media/kozos
fi

if [ ! -d "/media/mindenki" ]; then
 mkdir /media/mindenki
fi

if [ ! -d "/media/$felh" ]; then
 mkdir /media/$felh
fi



{
if [ "$TANAR" = "hamis" ]; then 
	echo "diak mount"
	sudo mount -t cifs //DELL-AD/iskola/tanulok/$felh /media/$felh -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu && MOUNTED="igaz"
	#sajat meghajto diak
else
	echo "tanar mount"
	sudo mount -t cifs //DELL-AD/iskola/tanulok/ /media/$felh -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu && MOUNTED="igaz"
 #sajátmeghajtó tanár
fi

} || {
#clear
MOUNTED="hamis"
echo "rossz felhasználó név kérlek probáld ujra"
rmdir /media/$felh 
} 
done

sudo mount -t cifs //DELL-AD/iskola/kozos /media/kozos -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu #kozos meghajtó

sudo mount -t cifs //DELL-AD/mindenki /media/mindenki -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu #mindenki meghajtó

echo $felh > /tmp/felh.txt

fi



