#!/data/data/com.termux/files/usr/bin/bash

VERSION_FILE="version.txt"
DATE=$(date +"%Y-%m-%d")
RANDOM_NUM=$((1000 + RANDOM % 9000))

# === Generate a new version ===
NEW_VERSION="CoopsOS-v$DATE-$RANDOM_NUM"
echo "$NEW_VERSION" > "$VERSION_FILE"

echo "Generated version: $NEW_VERSION" | lolcat

# === Git commit and tag ===
git add . && git commit -m "Release $NEW_VERSION"
git tag -a "$NEW_VERSION" -m "Official release $NEW_VERSION"
git push origin main
git push origin "$NEW_VERSION"

echo "Release $NEW_VERSION pushed to GitHub." | lolcat

# === Optional OTA/ZIP builder ===
if [ -f output/ota.zip ]; then
  echo "Uploading OTA zip (not automated yet)..." | lolcat
  # You could curl this to GitHub or another endpoint
else
  echo "No OTA ZIP found in ./output. Skipping upload." | lolcat
fi
