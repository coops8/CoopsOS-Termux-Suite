#!/data/data/com.termux/files/usr/bin/bash

# === Settings ===
ROM_OUTPUT_DIR="rom-output"
OTA_DIR="output"
OTA_NAME="CoopsOS-OTA-$(date +%Y%m%d).zip"

# === Build ZIP ===
mkdir -p "$OTA_DIR"
cd "$ROM_OUTPUT_DIR" || { echo "ROM output missing!"; exit 1; }

echo "Zipping ROM into OTA package..." | lolcat
zip -r "../$OTA_DIR/$OTA_NAME" . > /dev/null

echo "OTA ZIP created at: $OTA_DIR/$OTA_NAME" | lolcat
