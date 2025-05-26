#!/data/data/com.termux/files/usr/bin/bash

VERSION_FILE="version.txt"
DATE=$(date +"%Y-%m-%d")
RANDOM_NUM=$((1000 + RANDOM % 9000))
NEW_VERSION="CoopsOS-v$DATE-$RANDOM_NUM"

echo "$NEW_VERSION" > "$VERSION_FILE"
echo "Generated version: $NEW_VERSION" | lolcat

bash ~/CoopsOSRepo/build-ota.sh
git add .
git commit -m "Release $NEW_VERSION"
git tag -a "$NEW_VERSION" -m "Official release $NEW_VERSION"
git push origin main
git push origin "$NEW_VERSION"

bash ~/CoopsOSRepo/track-changelog.sh
bash ~/CoopsOSRepo/push-release.sh
