#!/data/data/com.termux/files/usr/bin/bash

# === CONFIG ===
REPO="coops8/CoopsOS-Termux-Suite"
VERSION_DIR="$HOME/CoopsOSRepo"
VERSION_FILE="$VERSION_DIR/version.json"
ZIP_DIR="/sdcard/Download"
ZIP_NAME=$(jq -r .version "$VERSION_FILE").zip
TAG_NAME=$(jq -r .version "$VERSION_FILE" | sed 's/CoopsOS-//')
CHANGELOG=$(jq -r .changelog "$VERSION_FILE")

# === CHECK FILE ===
if [ ! -f "$ZIP_DIR/$ZIP_NAME" ]; then
  echo "ERROR: Cannot find $ZIP_NAME in $ZIP_DIR"
  exit 1
fi

# === CREATE RELEASE ===
echo "Creating GitHub release..."
gh release create "$TAG_NAME" "$ZIP_DIR/$ZIP_NAME" \
  --repo "$REPO" \
  --title "$ZIP_NAME" \
  --notes "$CHANGELOG"
#!/data/data/com.termux/files/usr/bin/bash

echo "Pushing latest commits and tags to GitHub..." | lolcat
git push origin main
git push origin --tags
echo "Deployment Complete!" | lolcat
echo "Release $ZIP_NAME published successfully!"
