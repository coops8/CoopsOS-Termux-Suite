# ~/.git/hooks/post-commit (chmod +x it)
#!/data/data/com.termux/files/usr/bin/bash
echo ">>> CoopsOS Auto-Versioning Initiated..." | lolcat
VERSION="v$(date +%y.%m.%d.%H%M)"
git tag "$VERSION"
echo "Tagged new version: $VERSION" | lolcat
bash ~/CoopsOSRepo/push-release.sh
