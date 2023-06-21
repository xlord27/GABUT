#!/bin/bash
PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
IP=$(curl -sS ifconfig.me)
CITY=$(cat /etc/xray/city)
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#ssh# " "/etc/ssh/.ssh.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m          CONFIG SSH ACCOUNT          \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                clear
                exit 1
        fi

  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "  \e[1;97;101m        CONFIG SSH ACCOUNT         \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^#ssh# " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^#ssh# " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep "$uuid" /etc/ssh/.ssh.db | cut -b 21-56 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#ssh# " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

clear
echo -e ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          SSH OVPN ACCOUNT            \E[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Username         : $user" | tee -a /etc/ssh/user.log
echo -e "Password         : $PASSWD" | tee -a /etc/ssh/user.log
echo -e "Created          : $hariini"
echo -e "Expired          : $exp" | tee -a /etc/ssh/user.log
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "IP               : $IP" | tee -a /etc/ssh/user.log
echo -e "Host             : $domain" | tee -a /etc/ssh/user.log
echo -e "Host Slowdns     : ${NS}" | tee -a /etc/ssh/user.log
echo -e "Pub Key          : ${PUB}" | tee -a /etc/ssh/user.log
echo -e "Location         : $CITY" | tee -a /etc/ssh/user.log
echo -e "Port OpenSSH     : 443, 80, 22" | tee -a /etc/ssh/user.log
echo -e "Port DNS         : 443, 53 ,22 " | tee -a /etc/ssh/user.log
echo -e "Port Dropbear    : 443, 109" | tee -a /etc/ssh/user.log
echo -e "Port Dropbear WS : 443, 109" | tee -a /etc/ssh/user.log
echo -e "Port SSH WS      : 80 " | tee -a /etc/ssh/user.log
echo -e "Port SSH SSL WS  : 443" | tee -a /etc/ssh/user.log
echo -e "Port SSL/TLS     : 443" | tee -a /etc/ssh/user.log
echo -e "Port OVPN WS SSL : 443" | tee -a /etc/ssh/user.log
echo -e "Port OVPN SSL    : 443" | tee -a /etc/ssh/user.log
echo -e "Port OVPN TCP    : 443, 1194" | tee -a /etc/ssh/user.log
echo -e "Port OVPN UDP    : 2200" | tee -a /etc/ssh/user.log
echo -e "Proxy Squid      : 3128" | tee -a /etc/ssh/user.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/ssh/user.log
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/ssh/user.log
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "OpenVPN WS SSL   : https://$domain:81/"$domain"-ws-ssl.ovpn" | tee -a /etc/ssh/user.log
echo -e "OpenVPN SSL      : https://$domain:81/"$domain"-ssl.ovpn" | tee -a /etc/ssh/user.log
echo -e "OpenVPN TCP      : https://$domain:81/"$domain"-tcp.ovpn" | tee -a /etc/ssh/user.log
echo -e "OpenVPN UDP      : https://$domain:81/"$domain"-udp.ovpn" | tee -a /etc/ssh/user.log
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Save Link Account: https://$domain:81/ssh-$LOGIN.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" | tee -a /etc/ssh/user.log
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
