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
# ~/CoopsOSRepo/notify-telegram.sh
TOKEN="your_bot_token"
CHAT_ID="your_chat_id"
MESSAGE="CoopsOS update pushed! Version: $(git describe --tags --abbrev=0)"

curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
#!/data/data/com.termux/files/usr/bin/bash

ver_name=$1
ver_desc=$2
timestamp=$(date +"%Y-%m-%d_%H-%M")

if [ -z "$ver_name" ] || [ -z "$ver_desc" ]; then
  echo "Usage: make-version.sh <version-name> <description>" | lolcat
  exit 1
fi

echo "$timestamp - $ver_name: $ver_desc" >> version-history.log
echo "🆕 Version $ver_name created!" | lolcat
