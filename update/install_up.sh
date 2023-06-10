#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] WAITT DATA UPLOADING..."
sleep 2
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/xlord27/gabut/main/xray/menu-ws.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/xlord27/VPN/main/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/artanodrop/dxavier/main/update/menu-bot.sh" && chmod +x /usr/bin/menu-bot
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/xlord27/gabut/main/backup/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -0 /usr/bin/backup "https://raw.githubusercontent.com/xlord27/gabut/main/backup/set-br.sh" &&  chmod +x set-br.sh && ./set-br.sh
wget -q -O /usr/bin/user-ws "https://raw.githubusercontent.com/xlord27/gabut/main/xray/user-ws" && chmod +x /usr/bin/user-ws
wget -q -O /usr/bin/user-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/user-vless" && chmod +x /usr/bin/user-vless
wget -q -O /usr/bin/trial-ws "https://raw.githubusercontent.com/xlord27/gabut/main/xray/trial-ws" && chmod +x /usr/bin/trial-ws
wget -q -O /usr/bin/trial-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/trial-vless" && chmod +x /usr/bin/trial-vless
wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/xlord27/gabut/main/xray/renew-ws" && chmod +x /usr/bin/renew-ws
wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/renew-vless" && chmod +x /usr/renew-vless
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/xlord27/gabut/main/xray/add-ws" && chmod +x /usr/bin/add-ws
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/add-vless" && chmod +x /usr/bin/add-vless
wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/xlord27/gabut/main/xray/cek-ws" && chmod +x /usr/bin/cek-ws
wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/cek-vless" && chmod +x /usr/bin/cek-vless
wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/xlord27/gabut/main/xray/cek-del-ws" && chmod +x /usr/bin/del-ws
wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/xlord27/gabut/main/xray/del-vless" && chmod +x /usr/bin/del-vless
wget -q -O /root/xray.sh "https://${Server_URL}/xray.sh"
echo -e " [INFO] UPDATE BERHASIL..."
sleep 2
exit
