#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] WAITT DATA UPLOADING..."
sleep 2
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/xlord27/lowq/main/menu/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/xlord27/lowq/main/menu/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/xlord27/VPN/main/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-bot.sh" && chmod +x /usr/bin/menu-bot
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/xlord27/gabut/main/backup/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -0 /usr/bin/backup "https://raw.githubusercontent.com/xlord27/gabut/main/backup/set-br.sh" &&  chmod +x set-br.sh && ./set-br.sh
echo -e " [INFO] UPDATE BERHASIL..."
sleep 2
exit
