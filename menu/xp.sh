#!/bin/bash
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
##----- Auto Remove Vmess
data=($(cat /etc/xray/config.json | grep '^#vm#' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
    exp=$(grep -w "^#vm# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
        sed -i "/^#vm# $user $exp/,/^},{/d" /etc/xray/config.json
        sed -i "/^#vm# $user $exp/,/^},{/d" /etc/vmess/.vmess.db
    fi
done

#----- Auto Remove Vless
data=($(cat /etc/xray/config.json | grep '^#vl#' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
    exp=$(grep -w "^#vl# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
        sed -i "/^#vl# $user $exp/,/^},{/d" /etc/xray/config.json
        sed -i "/^#vl# $user $exp/,/^},{/d" /etc/vless/.vless.db
    fi
done

#----- Auto Remove Trojan
data=($(cat /etc/xray/config.json | grep '^#tr#' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
    exp=$(grep -w "^#tr# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
        sed -i "/^#tr# $user $exp/,/^},{/d" /etc/xray/config.json
        sed -i "/^#tr# $user $exp/,/^},{/d" /etc/trojan/.trojan.db
    fi
done
systemctl restart xray

##------ Auto Remove SSH
hariini=$(date +%d-%m-%Y)
cat /etc/shadow | cut -d: -f1,8 | sed /:$/d >/tmp/expirelist.txt
totalaccounts=$(cat /tmp/expirelist.txt | wc -l)
for ((i = 1; i <= $totalaccounts; i++)); do
    tuserval=$(head -n $i /tmp/expirelist.txt | tail -n 1)
    user=$(echo $tuserval | cut -f1 -d:)
    userexp=$(echo $tuserval | cut -f2 -d:)
    userexpireinseconds=$(($userexp * 86400))
    tglexp=$(date -d @$userexpireinseconds)
    tgl=$(echo $tglexp | awk -F" " '{print $3}')
    while [ ${#tgl} -lt 2 ]; do
        tgl="0"$tgl
    done
    while [ ${#user} -lt 15 ]; do
        username=$user" "
    done
    bulantahun=$(echo $tglexp | awk -F" " '{print $2,$6}')
    todaystime=$(date +%s)
    if [ $userexpireinseconds -ge $todaystime ]; then
        :
    else
        userdel --force $user
    fi
done
systemctl reload ssh
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m         DELETE EXFIRED ACCOUNT         \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " DELETE ACCOUNT EXFIRED SUKSES"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
