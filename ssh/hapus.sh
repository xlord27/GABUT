#!/bin/bash
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m          DELETE SSH ACCOUNT         \e[0m"
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
echo -e " \e[1;97;101m          DELETE SSH ACCOUNT         \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "     NO    User    Expired  "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
        read -rp "Select one client [1]: " CLIENT_NUMBER
    else
        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
done
if getent passwd $LOGIN > /dev/null 2>&1; then
        userdel $LOGIN > /dev/null 2>&1
        rm -rf /var/www/html/ssh-$LOGIN.txt
        TEXT="
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " \e[1;97m             SUCCES DELETE SSH  ACCOUNT       \e[0m"
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " Client Name : $LOGIN"
echo " Expired On  : $exp"
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
else
echo -e "  Failure: User $LOGIN Tidak Di Temukan."
echo""
read -n 1 -s -r -p "Press [enter] to back menu ssh"
menu
