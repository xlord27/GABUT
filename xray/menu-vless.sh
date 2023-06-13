#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/yokkovpn/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/yokkovpn/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/yokkovpn/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########


function trialvless(){
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
TIMES="10"
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m    CREATE TRIALL VMESS ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
domain=$(cat /etc/xray/domain)
PUB=$(cat /etc/slowdns/server.pub)
CITY=$(cat /etc/xray/city)
NS=$(cat /etc/xray/dns)
masaaktif=1
Quota=10
user=Trial-VL`</dev/urandom tr -dc 0-9 | head -c3`
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%H")
sed -i '/#vless$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat >/var/www/html/vless-$user.txt <<-END
=======================
      P R O J E C T
=======================
 Owner: t.me/RizkiHdyt99
=======================
 Format Vless WS (CDN)
=======================

- name: geostore-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  udp: true
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless WS (CDN) Non TLS
_______________________________
- name: geostore-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
  udp: true
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless gRPC (SNI)
_______________________________
- name: geostore-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true
_______________________________
 Link Vless Account
_______________________________
Link TLS : vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws#${user}"
_______________________________
Link none TLS : vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
_______________________________
Link GRPC : vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}
_______________________________

END
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
TEXT="
<code>────────────────────────────────</code>
<code>  SUCCES CREAT TRIALL VLESS ACCOUNT</code>
<code>────────────────────────────────</code>
<code>Remarks      : ${user}</code>
<code>Domain       : ${domain}</code>
<code>Host Slowdns : ${NS}</code>
<code>Pub Key      : ${PUB}</code>
<code>Location     : $CITY</code>
<code>User Quota   : ${Quota} GB</code>
<code>Port TLS     : 443</code>
<code>Port DNS     : 443, 53</code>
<code>Port NTLS    : 80, 8080, 2086</code>
<code>Port GRPC    : 443</code>
<code>User ID      : ${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Encryption.   :none</code>
<code>Network      : WS or gRPC</code>
<code>Path     : /vless - /multipath</code>
<code>Path Dynamic : CF-XRAY:http://bug.com</code>
<code>───────────────────────────</code>
<code>Link TLS     :</code> 
<code>${vlesslink1}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${vlesslink2}</code>
<code>───────────────────────────</code>
<code>Link GRPC    :</code> 
<code>${vlesslink3}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> https://${domain}:81/vless-$user.txt
<code>───────────────────────────</code>
<code>Expired On : $exp</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^#vl#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "#vl# ${user} ${exp} ${uuid} ${Quota}" >>/etc/vless/.vless.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m       SUCCES CREAT VLESS ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "Location    : $CITY"
echo -e "User Quota  : ${Quota} GB"
echo -e "port TLS    : 443"
echo -e "Port NTLS   : 80, 8080, 2086"
echo -e "Port GRPC   : 443"
echo -e "User ID     : ${uuid}"
echo -e "AlterId     : 0"
echo -e "Security    : auto"
echo -e "Encryption  : none"
echo -e "Path        : /vles - /multipath"
echo -e "Path Dynamic : CF-XRAY:http://bug.com</"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS   : ${vlesslink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link NTLS  : ${vlesslink2}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link GRPC  : ${vlesslink3}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Expired On : $exp"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back menu vless"
menu-vless
fi
}

function cekvless(){
clear
data=($(cat /etc/xray/config.json | grep '^#vl#' | cut -d ' ' -f 2 | sort | uniq))

    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m            CEK VLESS ACCOUNT           \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n >/tmp/ipvless.txt
    data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
    for ip in "${data2[@]}"; do

        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >>/tmp/ipvless.txt
        else
            echo "$ip" >>/tmp/other.txt
        fi
        jum2=$(cat /tmp/ipvless.txt)
        sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
    done

    jum=$(cat /tmp/ipvless.txt)
    if [[ -z "$jum" ]]; then
        echo >/dev/null
    else
        jum2=$(cat /tmp/ipvless.txt | nl)
        echo "user : $akun"
        echo "$jum2"
        echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    fi
    rm -rf /tmp/ipvless.txt
done

rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu-vless
fi
}

function renewvless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl# " "/etc/vless/.vless.db")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		 echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
         echo -e " \e[1;97;101m         RENEW VLESS ACCOUNT           \e[0m"
         echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo ""
		echo "You have no existing clients!"
        echo ""
		exit 1
	fi
	echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
         echo -e " \e[1;97;101m         RENEW VLESS ACCOUNT           \e[0m"
         echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
         echo "     NO    User    Expired  "
	
	grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2-3 | nl -s ') '
         echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client you want to renew [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER

        fi
	done
read -p "Extend (days): " masaaktif
user=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vl# $user $exp/#vl# $user $exp4/g" /etc/xray/config.json
sed -i "s/#vl# $user $exp/#vl# $user $exp4/g" /etc/vless/.vless.db
systemctl reload xray
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m       RENNEW VLESS ACCOUNT SUCCESS      \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"

menu-vmess
fi
}

function delvless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl# " "/etc/vless/.vless.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m         DELETE VLESS ACCOUNT           \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
fi

clear
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m         DELETE VLESS ACCOUNT           \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "     NO    User    Expired  "
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2-3 | nl -s ') '
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le     ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
        read -rp "Select one client [1]: " CLIENT_NUMBER
    else
        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
done
user=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#vl# $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#vl# $user $exp/d" /etc/vless/.vless.db
rm -rf /var/www/html/vless-$user.txt
systemctl reload xray
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m      SUCCES DELETE VLESS ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " Client Name : $user"
echo " Expired On  : $exp"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back menu vless"
menu-vless
fi
}

function addvless(){
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m            ADD VLESS ACCOUNT           \e[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m            ADD VLESS ACCOUNT           \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back menu vless"
    vless
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "Limit User (GB): " Quota
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat >/var/www/html/vless-$user.txt <<-END
=======================
      P R O J E C T
=======================
Owner: t.me/xlordVpn
=======================
      Format Vless WS (CDN)
=======================

- name: geostore-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  udp: true
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless WS (CDN) Non TLS
_______________________________
- name: geostore-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
  udp: true
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless gRPC (SNI)
_______________________________
- name: geostore-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true
_______________________________
 Link Vless Account
_______________________________
Link TLS : vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws#${user}"
_______________________________
Link none TLS : vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
_______________________________
Link GRPC : vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}
_______________________________

END
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
TEXT="
<code>──────────────────────────</code>
<code>    SUCCES CREAT AKUN VLESS</code>
<code>──────────────────────────</code>
<code>Remarks      : ${user}</code>
<code>Domain       : ${domain}</code>
<code>Location     : $CITY</code>
<code>User Quota   : ${Quota} GB</code>
<code>Port TLS     : 443</code>
<code>Port DNS     : 443, 53</code>
<code>Port NTLS    : 80, 8080, 2086</code>
<code>Port GRPC   : 443</code>
<code>Port XRAY   : 443,80</code>
<code>User ID      : ${uuid}</code>
<code>AlterId     : 0</code>
<code>Security    : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path         : /vless - /multipath</code>
<code>Path Dynamic : CF-XRAY:http://bug.com</code>
<code>──────────────────────────</code>
<code>Link TLS     :</code>
<code>${vlesslink1}</code>}
<code>───────────────────────────</code>
<code>Link NTLS    :</code>
<code>${vlesslink2}</code>
<code>───────────────────────────</code>
<code>Link GRPC    :</code>
<code>${vlesslink3}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> https://${domain}:81/vless-$user.txt
<code>───────────────────────────</code>
<code>Aktif Selama   : $masaaktif Hari</code>
<code>Dibuat Pada    : $tnggl</code>
<code>Berakhir Pada  : $expe</code>
<code>───────────────────────────</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^#vl#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "#vl# ${user} ${exp} ${uuid} ${Quota}" >>/etc/vless/.vless.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m       SUCCES CREAT VLESS ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "Location    : $CITY"
echo -e "User Quota  : ${Quota} GB"
echo -e "port TLS    : 443"
echo -e "Port DNS    : 443, 53 "
echo -e "Port NTLS   : 80, 8080, 2086"
echo -e "Port GRPC   : 443"
echo -e "Port XRAY   : 443,80"
echo -e "User ID     : ${uuid}"
echo -e "AlterId     : 0"
echo -e "Security    : auto"
echo -e "Encryption  : none"
echo -e "Path        : /vles - /multipath"
echo -e "Path Dynamic : CF-XRAY:http://bug.com</"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS   : ${vlesslink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link NTLS  : ${vlesslink2}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link GRPC  : ${vlesslink3}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $expe"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back menu vless"
menu-vless
}


clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m       •  VLESS MENU •            \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun XRAY Vless Websocket "
echo -e " [\e[36m•2\e[0m] Trial Akun XRAY Vless "
echo -e " [\e[36m•3\e[0m] Extending Akun XRAY Vless Active Life "
echo -e " [\e[36m•4\e[0m] Delete Akun XRAY Vless Websocket "
echo -e " [\e[36m•5\e[0m] Check User Login XRAY Vless "
echo -e " [\e[36m•6\e[0m] Show User XRAY Vless "
echo -e " [\e[36m•7\e[0m] Usage XRAY Vless "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mKEMBALI KE MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • Untuk-Keluar"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m       •XLORD PROJECT TUNNEL•         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; addvless ; exit ;;
2) clear ; trialvless ; exit ;;
3) clear ; renewvless ; exit ;;
4) clear ; delvless ; exit ;;
5) clear ; cekvless ; exit ;;
6) clear ; show-vless ; exit ;;
7) clear ; usage-vless ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
       
