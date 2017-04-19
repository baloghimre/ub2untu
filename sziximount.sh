#!/bin/bash

echo -e "\e[91m"

echo
echo -e "\e[7m Üdvözöljük a B2-ben \e[0m"
echo
echo -e "\e[93m Az iskolai hálózatra való bejelentkezéshez," 
echo " add meg a felhasználóneved és a jelszavad."
echo
echo "  üdv, Komáromi \"puncipecér\" Richárd"

#input=$(zenity --text="Kérem add meg a felhasználó neved " --username --password)
input=$(zenity --forms --title="Hálózati meghajtók csatolása" \
--text="Adja meg a felhasználó nevet, jelszót" \
--add-entry="Felhasználónév" \
--add-password="Jelszó" \
--width=500 \
--ok-label="BELÉPÉS" \
--cancel-label="MÉGSEM" )

IFS='|' read -a myarray <<< "$input"
felh=${myarray[0]}
jelsz=${myarray[1]}
#echo $felh
#echo $jelsz


#if [ "-u" = "$1" ]; then
#read -p "Felhasználó név: " felh 

sudo umount /media/tanulo/$felh >/dev/null 2>/dev/null  
sudo umount /media/tanulo/kozos  >/dev/null 2>/dev/null
sudo umount /media/tanulo/mindenki >/dev/null 2>/dev/null
 
 rmdir /media/tanulo/$felh >/dev/null 2>/dev/null
 rmdir /media/tanulo/kozos  >/dev/null 2>/dev/null
 rmdir /media/tanulo/mindenki >/dev/null 2>/dev/null
	
#else

#read -p "Felhasználó név: " felh 
#read -p "Jelszó:" -s jelsz
 


mkdir -m 777 /media/tanulo/$felh 
mkdir -m 777 /media/tanulo/kozos 
mkdir -m 777 /media/tanulo/mindenki 


sudo mount -t cifs //DELL-AD/iskola/tanulok/$felh /media/tanulo/$felh -o username=$felh,password=$jelsz,domain=szechenyi.szixi.hu,file_mode=0777,dir_mode=0777,uid=root  #sajátmeghajtó

sudo mount -t cifs //DELL-AD/iskola/kozos /media/tanulo/kozos -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu  #kozos meghajtó

sudo mount -t cifs //DELL-AD/mindenki /media/tanulo/mindenki -o username=$felh,rw,password=$jelsz,domain=szechenyi.szixi.hu #mindenki meghajtó


echo $felh > /tmp/felh.txt

#fi


