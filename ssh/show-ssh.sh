NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m                LIST NAME SSH                   \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back on menu ssh"
    menu
fi

  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "  \e[1;97;101m        Ketik Angka Untuk Lihat Detail         \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User   Exp"
        grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
#SEND TO SYSTEM
useradd -e `date -d "$EXPIRED days" +"%Y-%m-%d"` -s /bin/false -M $LOGIN
exp="$(chage -l $LOGIN | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $LOGIN &> /dev/null

#DETAIL SUCCESSFULLY ADD SSH
echo "Detail SSH Account" | tee -a /etc/userlog/ssh-$LOGIN.txt
echo "______________________" | tee -a /etc/userlog/ssh-$LOGIN.txt
echo -e "LOGIN       : $LOGIN" | tee -a /etc/userlog/ssh-$LOGIN.txt
echo -e "Password       : $PASSWD" | tee -a /etc/userlog/ssh-$LOGIN.txt
echo -e "Expired On     : $exp" | tee -a /etc/userlog/ssh-$LOGIN.txt
echo "______________________" | tee -a /etc/userlog/ssh-$LOGIN.txt
