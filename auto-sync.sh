#!/data/data/com.termux/files/usr/bin/bash

cd ~/CoopsOSRepo || exit 1

echo "🔄 Auto-syncing with remote repo..." | lolcat
git fetch origin main

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
  echo "📥 New update found! Pulling now..." | lolcat
  git pull origin main
else
  echo "✅ Already up to date." | lolcat
fi
