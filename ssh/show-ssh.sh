clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}Log Ssh Account${NC}                 "
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e "  ${YB}You have no existing clients!${NC}"
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
clear
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}Log Ssh Account${NC}                 "
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
echo -e " ${YB}User  Expired${NC}  "
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
grep -E "^### " "/etc/ssh/.ssh.db"| cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "${YB}tap enter to go back${NC}"
echo -e "${CYAN}————————————————————————————————————————————————————${NC}"
read -rp "Input Username : " user
if [ -z $user ]; then
menu
else
clear
echo -e"`cat "/var/www/html/ssh-$LOGIN.txt"`"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
