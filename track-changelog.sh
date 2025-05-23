#!/data/data/com.termux/files/usr/bin/bash

VERSION_FILE="$HOME/CoopsOSRepo/version.json"
LOG_FILE="$HOME/CoopsOSRepo/changelog_history.md"

VERSION=$(jq -r .version "$VERSION_FILE")
CHANGELOG=$(jq -r .changelog "$VERSION_FILE")
DATE=$(date)

echo -e "### $VERSION\n- $CHANGELOG\n- Date: $DATE\n" >> "$LOG_FILE"
echo "Logged to $LOG_FILE"
