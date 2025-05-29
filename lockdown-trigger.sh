#!/data/data/com.termux/files/usr/bin/bash

echo "⚠️  SYSTEM LOCKDOWN INITIATED ⚠️" | lolcat
echo "🔒 All non-dev functions suspended." | lolcat
echo "🚨 This action will be logged and require dev key to reverse." | lolcat

# Log the action
timestamp=$(date)
echo "[LOCKDOWN] Triggered at $timestamp by $(whoami)" >> ~/CoopsOSRepo/security-log.txt

# Optionally block critical access
touch ~/CoopsOSRepo/.lockdown

# Add flags or trigger commands
am start -a android.intent.action.VIEW -d "http://127.0.0.1/lockdown" >/dev/null 2>&1 &

# Force logout or shell restriction
pkill -KILL -u $(whoami)

# Optional: Display message before full lockdown
echo "Device is now in lockdown mode. Dev key required for exit." | lolcat
exit 0
