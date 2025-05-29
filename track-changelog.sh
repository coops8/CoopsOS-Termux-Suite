#!/data/data/com.termux/files/usr/bin/bash

LOG_FILE="CHANGELOG.md"
VERSION=$(cat version.txt)
DATE=$(date +"%Y-%m-%d %H:%M")

echo "Enter changelog for $VERSION (end with Ctrl+D):"
echo -e "\n## $VERSION - $DATE\n" >> "$LOG_FILE"
cat >> "$LOG_FILE"
echo -e "\n---\n" >> "$LOG_FILE"

git add "$LOG_FILE"
git commit -m "Changelog for $VERSION"
#!/data/data/com.termux/files/usr/bin/bash

echo ">>> CoopsOS Changelog <<<" | lolcat
git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short

# gui.sh
dialog --menu "CoopsOS Control Panel" 15 50 5 \
1 "Update ROM" \
2 "Enter Dev Mode" \
3 "Check Version" \
4 "Rollback" \
5 "Exit" 2>choice.txt
#!/data/data/com.termux/files/usr/bin/bash

echo "📘 Changelog:" | lolcat
cat version-history.log | tail -n 20
