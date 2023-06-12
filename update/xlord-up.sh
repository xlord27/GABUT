#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] WAITT DATA UPLOADING..."
sleep 2
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/xlord27/gabut/main/menu/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
echo -e " [INFO] UPDATE BERHASIL..."
sleep 2
exit
