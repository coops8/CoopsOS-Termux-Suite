#!/data/data/com.termux/files/usr/bin/bash

dialog --title "CoopsOS ROM Builder" --menu "Choose an option:" 15 50 6 \
1 "Build ROM" \
2 "Make Flashable ZIP" \
3 "Push OTA Update" \
4 "Flash ROM" \
5 "Clean Build" \
6 "Exit" 2>choice.txt

choice=$(cat choice.txt)

case $choice in
  1) echo "Building ROM..."; sleep 1 ;;
  2) echo "Packing into flashable ZIP..."; sleep 1 ;;
  3) echo "Uploading OTA update..."; sleep 1 ;;
  4) echo "Flashing ROM..."; sleep 1 ;;
  5) echo "Cleaning build folders..."; rm -rf out/; sleep 1 ;;
  6) echo "Exiting..."; exit ;;
esac

rm choice.txt
