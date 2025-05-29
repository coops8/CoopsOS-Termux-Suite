#!/data/data/com.termux/files/usr/bin/bash

echo "🔧 Launching Coops Control Room..." | lolcat
cd ~/CoopsOSRepo

# Kickoff suite
bash coops status
bash check-key.sh && echo "✅ Dev verified!"

# Menu (basic prototype, want full TUI?)
PS3="Choose your protocol: "
options=("Update Suite" "Make Version" "Push Release" "View Changelog" "Activate Lockdown" "Exit")
select opt in "${options[@]}"; do
  case $opt in
    "Update Suite")
      bash ota-updater.sh ;;
    "Make Version")
      read -p "Version name: " name
      read -p "Summary: " desc
      bash make-version.sh "$name" "$desc" ;;
    "Push Release")
      bash push-release.sh ;;
    "View Changelog")
      bash track-changelog.sh ;;
    "Activate Lockdown")
      bash lockdown-trigger.sh ;;
    "Exit")
      break ;;
    *) echo "Invalid option" ;;
  esac
done
