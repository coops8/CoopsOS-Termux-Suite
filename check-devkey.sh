fetch)
  echo "Fetching latest OTA patch..." | lolcat
  curl -O https://raw.githubusercontent.com/coops8/CoopsOS-Termux-Suite/main/patches/$(date +%Y%m%d).sh
  bash $(date +%Y%m%d).sh
  ;;
