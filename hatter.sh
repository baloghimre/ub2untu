#!/bin/bash
MIN=1
MAX=9
rnd=$(( $RANDOM % ($MAX + 1 - $MIN) + $MIN ))
#for i in {1..5}; do echo $RANDOM; done
echo "fasz"
rm -rf /rendszer/wallpapers/wallpaper.jpg
cp -f /rendszer/wallpapers/$rnd.jpg /rendszer/wallpapers/wallpaper.jpg

