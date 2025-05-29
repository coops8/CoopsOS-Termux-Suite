#!/data/data/com.termux/files/usr/bin/bash

VERSION=$(cat version.txt)
OTA_ZIP=$(ls output/CoopsOS-OTA-*.zip | tail -n1)
CHANGELOG=$(cat CHANGELOG.md | sed -n "/## $VERSION/,/---/p")

echo "Pushing GitHub release for $VERSION..." | lolcat

gh release create "$VERSION" "$OTA_ZIP" \
  --title "$VERSION" \
  --notes "$CHANGELOG"

echo "Release published: $VERSION" | lolcat
while true; do
  cd ~/CoopsOSRepo && git pull origin main
  sleep 3600
done
#!/data/data/com.termux/files/usr/bin/bash

echo "🔼 Pushing updates to GitHub..." | lolcat
cd ~/CoopsOSRepo || exit 1
git add .
git commit -m "🚀 CoopsOS Auto Push: $(date)"
git push origin main
