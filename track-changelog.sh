#!/data/data/com.termux/files/usr/bin/bash

LOG_FILE="CHANGELOG.md"
VERSION=$(cat version.txt)
DATE=$(date +"%Y-%m-%d %H:%M")

echo "Enter changelog for $VERSION (end with Ctrl+D):"
echo -e "\n## $VERSION - $DATE\n" >> "$LOG_FILE"
cat >> "$LOG_FILE"
echo -e "\n---\n" >> "$LOG_FILE"

git add "$LOG_FILE"
git commit -m "Changelog for $VERSION"
