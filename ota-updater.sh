#!/data/data/com.termux/files/usr/bin/bash

VERSION_URL="https://raw.githubusercontent.com/coops8/CoopsOS-Termux-Suite/main/version.json"
LOCAL_VERSION_FILE="$HOME/.coopsos_version"

function fetch_remote_version() {
  curl -s "$VERSION_URL" -o /tmp/version.json
  jq -r .version /tmp/version.json
}

function fetch_local_version() {
  if [ -f "$LOCAL_VERSION_FILE" ]; then
    cat "$LOCAL_VERSION_FILE"
  else
    echo "0.0.0"
  fi
}

function update_prompt() {
  changelog=$(jq -r .changelog /tmp/version.json)
  dialog --title "CoopsOS Update Available" \
         --yesno "New Version Available:\n$remote_version\n\nChangelog:\n$changelog\n\nDo you want to update?" 15 50
}

function download_and_install() {
  url=$(jq -r .download_url /tmp/version.json)
  echo "Downloading from $url..." | lolcat
  curl -L "$url" -o /sdcard/Download/CoopsOS_Update.zip
  echo "$remote_version" > "$LOCAL_VERSION_FILE"
  echo "Update downloaded to /sdcard/Download/CoopsOS_Update.zip"
  echo "Flash it via recovery." | lolcat
}

remote_version=$(fetch_remote_version)
local_version=$(fetch_local_version)

if [ "$remote_version" != "$local_version" ]; then
  update_prompt
  if [ $? -eq 0 ]; then
    download_and_install
  else
    echo "Update canceled."
  fi
else
  echo "You already have the latest version: $local_version"
fi
