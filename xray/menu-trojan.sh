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


function trialtrojan(){
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
domain=$(cat /etc/xray/domain)
PUB=$(cat /etc/slowdns/server.pub)
CITY=$(cat /etc/xray/city)
NS=$(cat /etc/xray/dns)
TIMES="10"
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m     CREATE TRIALL TROJAN ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
masaaktif=1
Quota=5
user=Trial-TR`</dev/urandom tr -dc 0-9 | head -c3`
clear
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%H")
sed -i '/#trojanws$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat >/var/www/html/trojan-$user.txt <<-END
=============================
         P R O J E C T
=============================
 Owner: t.me/Xlord 
=============================
 Format Trojan GO/WS (CDN)
=============================

- name: Trojan-$user-GO/WS (CDN)
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}
_______________________________
  Format Trojan gRPC
_______________________________

- name: Trojan-$user-gRPC (SNI)
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc

_______________________________
Link Trojan Triall Account
_______________________________
Link WS : trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}
_______________________________
Link GRPC : trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}
_______________________________



END
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"

TEXT="
<code>──────────────────────────</code>
<code>    SUCCES CREAT TRIALL TROJAN</code/>
<code>──────────────────────────</code>
<code>Remarks      : ${user}</code>
<code>Domain       : ${domain}</code>
<code>Host Slowdns : ${NS}</code>
<code>Pub Key     : ${PUB}</code>
<code>Location     : $CITY</code>
<code>User Quota   : ${Quota} GB</code>
<code>Port DNS     : 443,53</code>
<code>Port WS(TLS)  : 443</code>
<code>Port GRPC     : 443</code>
<code>User ID     : ${uuid}</code>
<code>AlterId      : 0</code>
<code>Security    : auto</code>
<code>Network    : WS(TLS) or gRPC</code>
<code>ServiceName  : trojan-grpc</code>
<code>──────────────────────────</code>
<code>Link TLS     :</code> 
<code>${trojanlink}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${trojanlink1}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> 
https://${domain}:81/trojan-$user.txt
<code>️Expired On : $exp</code>
<code>──────────────────────────</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^#tr#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "#tr# ${user} ${exp} ${uuid} ${Quota}" >>/etc/trojan/.trojan.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m   SUCCES TRIALL TROJAN ACCOUNT      \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Host           : ${domain}"
echo -e "Location       : $CITY"
echo -e "User Quota     : ${Quota} GB"
echo -e "Port WS(TLS)   : 443"
echo -e "Port  gRPC     : 443"
echo -e "User ID        : ${uuid}"
echo -e "AlterID        : 0"
echo -e "Security       : auto"
echo -e "Path           : /trojan"
echo -e "Network        : WS(TLS) or gRPC"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link WS   : ${trojanlink}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link GRPC : ${trojanlink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Expired On : $exp"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu-trojan
fi
}

function cektrojan(){
clear
echo -n >/tmp/other.txt
data=($(cat /etc/xray/config.json | grep '^#tr#' | cut -d ' ' -f 2 | sort | uniq))

    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m           CEK TROJAN ACCOUNT           \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n >/tmp/iptrojan.txt
    data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
    for ip in "${data2[@]}"; do

        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >>/tmp/iptrojan.txt
        else
            echo "$ip" >>/tmp/other.txt
        fi
        jum2=$(cat /tmp/iptrojan.txt)
        sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
    done

    jum=$(cat /tmp/iptrojan.txt)
    if [[ -z "$jum" ]]; then
        echo >/dev/null
    else
        jum2=$(cat /tmp/iptrojan.txt | nl)
        echo "user : $akun"
        echo "$jum2"
        echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    fi
    rm -rf /tmp/iptrojan.txt
done

rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu-trojan
}


function deltrojan(){
    clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr# " "/etc/trojan/.trojan.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m          DELETE TROJAN ACCOUNT         \e[0m"
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
echo -e " \e[1;97;101m          DELETE TROJAN ACCOUNT         \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "     NO    User    Expired  "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 2-3 | nl -s ') '
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
        read -rp "Select one client [1]: " CLIENT_NUMBER
    else
        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
done
user=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#tr# $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#tr# $user $exp/d" /etc/trojan/.trojan.db
rm -rf /var/www/html/trojan-$user.txt
systemctl reload xray
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m      SUCCES DELETE TROJAN ACCOUNT      \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " Client Name : $user"
echo " Expired On  : $exp"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-trojan
fi
}

function renewtrojan(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr# " "/etc/trojan/.trojan.db")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		 echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
         echo -e " \e[1;97;101m        RENEW TROJAM ACCOUNT           \e[0m"
         echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo ""
		echo "You have no existing clients!"
        echo ""
		exit 1
	fi
	echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
         echo -e " \e[1;97;101m        RENEW TROJAN ACCOUNT           \e[0m"
         echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
         echo "     NO    User    Expired  "
	
	grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 2-3 | nl -s ') '
         echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client you want to renew [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER

        fi
	done
read -p "Extend (days): " masaaktif
user=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#tr# $user $exp/#tr# $user $exp4/g" /etc/xray/config.json
sed -i "s/#tr# $user $exp/#tr# $user $exp4/g" /etc/trojan/.trojan.db
systemctl reload xray
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m       RENNEW TROJAN ACCOUNT SUCCESS      \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"

menu-trojan
fi
}

function addtrojan(){
domain=$(cat /etc/xray/domain)
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m            ADD TROJAN ACCOUNT            \e[0m"  
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "User: " -e user
  user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${user_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m            ADD TROJAN ACCOUNT            \e[0m"  
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ enter ] to back on menu trojan"
    trojan
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
sed -i '/#trojanws$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat >/var/www/html/trojan-$user.txt <<-END
=============================
          P R O J E C T
=============================
Owner: t.me/XlordVpn
=============================
 Format Trojan GO/WS (CDN)
=============================

- name: Trojan-$user-GO/WS (CDN)
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}
_______________________________
  Format Trojan gRPC
_______________________________

- name: Trojan-$user-gRPC (SNI)
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc

_______________________________
Link Trojan Account
_______________________________
Link WS : trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}
_______________________________
Link GRPC : trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}
_______________________________



END
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
TEXT="
<code>──────────────────────────</code>
<code>    SUCCES CREAT TRIALL TROJAN</code>
<code>──────────────────────────</code>
<code>Remarks      : ${user}</code>
<code>Domain       : ${domain}</code>
<code>Location     : $CITY</code>
<code>User Quota   : ${Quota} GB</code>
<code>Port DNS     : 443,53</code>
<code>Port WS(TLS)     : 443</code>
<code>Port GRPC     : 443</code>
<code>User ID      : ${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS(TLS) or gRPC</code>
<code>ServiceName  : trojan-grpc</code>
<code>──────────────────────────</code>
<code>Link TLS     :</code> 
<code>${trojanlink}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${trojanlink1}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> 
https://${domain}:81/trojan-$user.txt
<code>──────────────────────────</code>
<code>Aktif Selama   : $masaaktif Hari</code>
<code>Dibuat Pada    : $tnggl</code>
<code>Berakhir Pada  : $expe</code>
<code>───────────────────────────</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^#tr#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "#tr# ${user} ${exp} ${uuid} ${Quota}" >>/etc/trojan/.trojan.db
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m            SUCCES CREAT TROJAN ACCOUNT               \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Host           : ${domain}"
echo -e "Location       : $CITY"
echo -e "User Quota     : ${Quota} GB"
echo -e "Port WS(TLS)   : 443"
echo -e "Port  gRPC     : 443"
echo -e "User ID        : ${uuid}"
echo -e "AlterID        : 0"
echo -e "Security       : auto"
echo -e "Path           : /trojan"
echo -e "Network        : WS(TLS) or gRPC"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link WS   : ${trojanlink}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link GRPC : ${trojanlink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $expe"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back menu trojan"
trojan
}

clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m      • TROJAN  MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun Trojan "
echo -e " [\e[36m•2\e[0m] Trial Akun Trojan "
echo -e " [\e[36m•3\e[0m] Extending Akun Trojan Active Life "
echo -e " [\e[36m•4\e[0m] Delete Akun Trojan "
echo -e " [\e[36m•5\e[0m] Check User Login Trojan "
echo -e " [\e[36m•6\e[0m] Show User Login Trojan "
echo -e " [\e[36m•7\e[0m] Usage User  Trojan "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mMENU KE MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • Untuk-Keluar"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m       • XLORD PROJECT TUNNEL•         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; addtrojan ;;
2) clear ; trialtrojan ;;
3) clear ; renewtrojan ;;
4) clear ; deltrojan ;;
5) clear ; cektrojan ;;
6) clear ; show-trojan ;;
7) clear ; usage-trojan ;;
0) clear ; menu ;;
x) exit ;;
*) echo "kamu salah tekan, Sayang" ; sleep 1 ; menu-trojan ;;
esac
       
