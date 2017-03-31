#!/bin/bash

input=$(zenity --text "Kérem add meg a felhasználó neved " \
        --username --password)

IFS='|' read -a myarray <<< "$input"
felh=${myarray[0]}
jelsz=${myarray[1]}



#if [ "-u" = "$1" ]; then
#read -p "Felhasználó név: " felh 

 umount /media/$felh 
 umount /media/kozos 
 umount /media/mindenki 
 
 rmdir /media/$felh 
 rmdir /media/kozos 
 rmdir /media/mindenki 
	
#else

#read -p "Felhasználó név: " felh 
#read -p "Jelszó:" -s jelsz


mkdir -m 777 /media/tanulo/$felh 
mkdir -m 777 /media/tanulo/kozos 
mkdir -m 777 /media/tanulo/mindenki 



sudo mount -t cifs //DELL-AD/iskola/tanulok/$felh /media/tanulo/$felh -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu  #sajátmeghajtó

sudo mount -t cifs //DELL-AD/iskola/kozos /media/tanulo/kozos -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu  #kozos meghajtó

sudo mount -t cifs //DELL-AD/mindenki /media/tanulo/mindenki -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu #mindenki meghajtó

echo $felh > /tmp/felh.txt

#fi
#!!!!!!!!!!!!!!
# sudo visudo-ba beírni az mkdirt!!!

