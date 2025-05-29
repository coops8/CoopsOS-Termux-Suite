#!/data/data/com.termux/files/usr/bin/bash

read -p "🔑 Enter Dev Key: " key

if [ "$key" == "coops-rom123654" ]; then
  echo "✅ Developer Mode Enabled." | lolcat
else
  echo "❌ ACCESS DENIED. SYSTEM WILL LOCK." | lolcat
  bash lockdown-trigger.sh
  exit 1
fi
