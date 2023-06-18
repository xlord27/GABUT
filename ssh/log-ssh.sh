clear
NC='\e[0m'

DEFBOLD='\e[39;1m'

RB='\e[31;1m'

GB='\e[32;1m'

YB='\e[33;1m'

BB='\e[34;1m'

MB='\e[35;1m'

CB='\e[35;1m'

WB='\e[37;1m'

# ==========================================

# Color

RED='\033[0;31m'

NC='\033[0m'

GREEN='\033[0;32m'

ORANGE='\033[0;33m'

BLUE='\033[0;34m'

PURPLE='\033[0;35m'

CYAN='\033[0;36m'

LIGHT='\033[0;37m'

# ==========================================

clear

echo -e "${CYAN}┌──────────────────────────────────┐${NC}" 

echo -e "   \E[0;36;44;1m      LOG CREATE SSH AKUN  \E[0m"

echo -e "${CYAN}└──────────────────────────────────┘${NC}" 

echo -e "${CYAN}──────────────────────────────────${NC}" 

echo "USERNAME EXP DATE        "

echo -e "${CYAN}──────────────────────────────────${NC}" 

while read expired

do

AKUN="$(echo $expired | cut -d: -f1)"

ID="$(echo $expired | grep -v nobody | cut -d: f3)"

exp="(chage -1 $AKUN | grep "Account expires" | awk -F": " '{print $2}')"

status="$(passwd -S $AKUN | awk  '{print $2}' )"

if [[ "$ID -ge 1000 ]]; then

if [[ "$status" = "L" ]]; then 

printf "%-17s %2s %-17s %2s \n" " $AKUN" "exp   "

else

printf "%-17s %2s %-17s %2s \n" " $AKUN" "exp   "

fi

fi

done < /etc/passwd

echo""

echo -e "${CYAN}──────────────────────────────────${NC}" 

echo""

read -rp "Input Username : " user

CLIENTS_EXISTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")

if [[ ${CLIENTS_EXISTS} == '0' ]]; then

clear

echo " Failure User Not Found"

else

echo -e "`cat "/etc/sshlog/log-ssh-$user.txt"`"

fi

echo""

read -n 1 -s -r -p "tekan enter untuk kembali"

menu
