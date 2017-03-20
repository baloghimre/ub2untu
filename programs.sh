#!/bin/bash
TIP=""
clear
echo
echo "\033[33m II. PROGRAMOK TELEPÍTÉSE\033[0m"
echo

# Kérdezze meg, hogy tanári vagy tanulói számítógép.
# programok-tanulo.txt vagy programok-tanar.txt (utóbbi esetében tegye fel a lubuntu-desktop csomagot is!)
# a választást mentse egy "user" nevű fájlba (tartalma: tanulo vagy tanari) - később a felhasználók
# létrehozásánál szükségünk lesz rá. (következő script)


rm -rf /tmp/telepiteni.txt


echo "Kérem a telepítési módót! 0/1"
echo "0 : Diák"
echo "1 : Tanár"
read TIP
echo -n "Kiválasztott telepítésí mód : "
echo $TIP


if [ $TIP = "1" ]; then

while read line; do    
    
    printf $line >> /tmp/telepiteni.txt
    printf " " >> /tmp/telepiteni.txt

done < programok-tanari.txt

while read p; do    
       echo "A következő programok kerülnek telepítésre:"
       echo
done < /tmp/telepiteni.txt
echo $p
echo ""
echo "A telepítés 5 másodperc múlva elindul.."
sleep 5

sudo apt-get --yes install $p 
	
else

while read line; do    
    
    printf $line >> /tmp/telepiteni.txt
    printf " " >> /tmp/telepiteni.txt

done < programok-tanari.txt

while read p; do    
       echo "A következő programok kerülnek telepítésre:"
       echo
done < /tmp/telepiteni.txt
echo $p
echo ""
echo "A telepítés 5 másodperc múlva elindul.."
sleep 5

sudo apt-get --yes install $p 

fi

# BELSŐ HÁLÓ!!
echo "Packet Tracer 6.3 letöltése"
wget http://10.111.40.1/~iso/Packet%20Tracer%206.3/PacketTracer63_linux.tar.gz
tar -xf PacketTracer63_linux.tar.gz
cd PacketTracer63
echo "Packet Tracer 6.3 telepítése..."
sudo ./install

