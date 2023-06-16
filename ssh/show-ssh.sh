clear
NUMBER_OF_CLIENTS=$(grep -c -E "### " "/etc/ssh/.ssh.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e "                  ${WB}Log Ssh Account${NC}                 "
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e "  ${YB}You have no existing clients!${NC}"
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
clear
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e "                  ${WB}Log Ssh Account${NC}                 "
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e " ${YB}User  Expired${NC}  "
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
grep -E "### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "${YB}tap enter to go back${NC}"
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
read -p "  Username : " LOGIN
clear
IP=$(curl -sS ifconfig.me)
CITY=$(cat /etc/xray/city)
PUB=$( cat /etc/slowdns/server.pub )
NS=`cat /etc/xray/dns`
domain=`cat /etc/xray/domain`
user=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
exp=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "$PASSWD\n$PASSWD\n"|passwd $LOGIN &> /dev/null
cat > /var/www/html/ssh-$LOGIN.txt <<-END

END
TEXT="
<code>───────────────────────────</code>
<code>      SSH OVPN Account     </code>
<code>───────────────────────────</code>
<code>Username         : $LOGIN</code>
<code>Password         : $PASSWD</code>
<code>Expired          : $exp</code>
<code>───────────────────────────</code>
<code>IP               : $IP</code>
<code>Host             : $domain</code>
<code>Host Slowdns     : ${NS}</code>
<code>Pub Key          : ${PUB}</code>
<code>Location         : $CITY</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port Dropbear WS : 443, 109</code>
<code>Port DNS         : 443, 53, 22</code> 
<code>Port SSH WS      : 80 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 443</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>Proxy Squid      : 3128</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>───────────────────────────</code>
<code>Payload WSS      : </code><code>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────────────</code>
<code>OpenVPN WS SSL   : </code>http://$domain:81/ws-ssl.ovpn
<code>OpenVPN SSL      : </code>http://$domain:81/ssl.ovpn
<code>OpenVPN TCP      : </code>http://$domain:81/tcp.ovpn
<code>OpenVPN UDP      : </code>http://$domain:81/udp.ovpn
<code>───────────────────────────</code>
<code>Save Link Account: </code>http://$domain:81/ssh-$LOGIN.txt
<code>───────────────────────────</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
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
echo -e "Payload WS" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
