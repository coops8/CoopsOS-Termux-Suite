#!/data/data/com.termux/files/usr/bin/bash

# === CONFIGURATION ===
REPO_NAME="CoopsOS-Termux-Suite"
VERSION_DIR="$HOME/CoopsOSRepo"
VERSION_FILE="$VERSION_DIR/version.json"
DATE=$(date +%y.%m.%d)
BASE_URL="https://github.com/coops8/${REPO_NAME}/releases/download"

# === INPUT HANDLING ===
if [ $# -lt 2 ]; then
  echo "Usage: $0 \"Changelog message\" BUILD_TYPE"
  echo "Example: $0 \"Fixed bugs and added new launcher\" BETA"
  exit 1
fi

CHANGELOG="$1"
BUILD_TYPE="$2"
VERSION_NAME="CoopsOS-v${DATE}-${BUILD_TYPE}"
ZIP_NAME="${VERSION_NAME}.zip"
TAG_NAME="v${DATE}"

# === BUILD THE JSON ===
cat > "$VERSION_FILE" <<EOF
{
  "version": "$VERSION_NAME",
  "changelog": "$CHANGELOG",
  "download_url": "$BASE_URL/${TAG_NAME}/${ZIP_NAME}",
  "force_update": false
}
EOF

# === FINAL OUTPUT ===
echo "Version JSON created at $VERSION_FILE:"
cat "$VERSION_FILE" | jq
