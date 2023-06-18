echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[42m              SSH Ovpn Account           \E[0m"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " LOGIN
read -p "Password : " PASSWD
read -p "Expired (hari): " EXPIRED
IP=$(curl -sS ifconfig.me)
CITY=$(cat /etc/xray/city)
PUB=$( cat /etc/slowdns/server.pub )
NS=`cat /etc/xray/dns`
domain=`cat /etc/xray/domain`
useradd -e `date -d "$EXPIRED days" +"%Y-%m-%d"` -s /bin/false -M $LOGIN
exp="$(chage -l $LOGIN | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $LOGIN &> /dev/null

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${LOGIN}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${LOGIN}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${LOGIN}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${LOGIN} " >>/etc/ssh/.ssh.db

cat > "`cat "/etc/sshlog/log-ssh-$user.txt"`"
clear
echo -e "\e[33m———————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m       XLORD TUNNELING            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $LOGIN" | tee -a /etc/log-create-user.log
echo -e "Password    : $PASSWD" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m           INFORMASI SERVER      \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Domain        : $domain" | tee -a /etc/log-create-user.log
echo -e "Nameserver  : $sldomain" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : 22" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : 80" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : 443" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : 447 , 777" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 53,5300,443" 
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "SSH-80      : $domain:80@$LOGIN:$PASSWD"
echo -e "SSH-443     : $domain:443@$LOGIN:$PASSWD"
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-user.log
echo -e "SETING-UDP  : $domain:1-65535@$LOGIN:$PASSWD"
#echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
#echo -e "OpenVPN Config : http://$IP:81/" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload WSS" | tee -a /etc/log-create-user.log
echo -e "
GET wss://$domain [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload WS" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu