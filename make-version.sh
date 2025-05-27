#!/data/data/com.termux/files/usr/bin/bash

VERSION_NAME=${1:-"v$(date +%Y.%m.%d-%H%M)"}
VERSION_TAG="coopsOS-${VERSION_NAME}"

echo "Creating new version: $VERSION_TAG" | lolcat

# Commit current changes
git add .
git commit -m "New version: $VERSION_TAG"

# Tag it!
git tag -a "$VERSION_TAG" -m "Release $VERSION_TAG"
echo "Tagged as $VERSION_TAG" | lolcat
