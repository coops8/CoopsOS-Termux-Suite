#!/data/data/com.termux/files/usr/bin/bash

echo "Launching CoopsOS Terminal DevStation Setup..." | lolcat
sleep 1

# STEP 1: Install necessary packages
pkg update -y && pkg upgrade -y
pkg install -y git figlet toilet neofetch lolcat termux-api dialog nano

# STEP 2: Setup MOTD
cat << 'EOF' > /data/data/com.termux/files/usr/etc/motd
clear
sleep 0.5
toilet -f future --gay "Booting..."
sleep 1
figlet -f slant "CoopsOS Dev Terminal" | lolcat
echo "Welcome back, Commander Coops!" | lolcat
echo "ROM Development Environment: [READY]" | lolcat
echo "Run 'coops help' for commands." | lolcat
EOF

# STEP 3: Voice Greeting
echo 'termux-tts-speak "Welcome back Coops, ROM dev mode online."' >> ~/.bashrc

# STEP 4: Custom Coops Command
cat << 'EOF' > ~/coops
#!/data/data/com.termux/files/usr/bin/bash

function check_key() {
  read -p "Enter Dev Key: " key
  if [ "$key" == "coops-rom123654" ]; then
    echo "Developer Mode Activated." | lolcat
  else
    echo "ACCESS DENIED" | lolcat
    exit 1
  fi
}

function build_rom() {
  echo "Launching Remote ROM Builder..." | lolcat
  cd ~/CoopsOSRepo || { echo "Repo not found!"; exit 1; }
  bash rom-builder.sh
}

case "$1" in
  help)
    echo ">>> CoopsOS Dev Commands <<<"
    echo "coops status        - Device Info"
    echo "coops update        - Pull latest CoopsSuite"
    echo "coops build         - Launch ROM Builder"
    echo "coops devmode       - Developer Key Access"
    ;;
  status)
    neofetch
    ;;
  update)
    echo "Pulling latest from GitHub..." | lolcat
    cd ~/CoopsOSRepo && git pull origin main
    ;;
  build)
    build_rom
    ;;
  devmode)
    check_key
    ;;
  *)
    echo "Unknown command. Try: coops help"
    ;;
esac
EOF

chmod +x ~/coops
echo 'alias coops=~/coops' >> ~/.bashrc && source ~/.bashrc

# STEP 5: Clone GitHub Repo
rm -rf ~/CoopsOSRepo
git clone https://github.com/coops8/CoopsOS-Termux-Suite.git ~/CoopsOSRepo

echo "Installation complete. You can now use 'coops' commands." | lolcat
