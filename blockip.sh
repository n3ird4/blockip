#!/bin/bash
# Author: n3ird4
# https://github.com/n3ird4/blockip.git 
# Tue Feb 23:42:41 CET 2023
# Little old script needs a quick refresh ^-^ 

#!/bin/bash

# COLORS
end='\033[0m'
white='\033[0;37m'
whiteb='\033[1;37m'
red='\033[0;31m'
redb='\033[1;31m'
green='\033[0;32m'
greenb='\033[1;32m'

# CURL IPINFO and BLACKHOLE
if [ -z "$1" ]; then
    printf "%b\n" "${whiteb}GIMME AN IP ADRESS ILL LET U KNOW WHO U ARE :)${end}"
    exit 42
else
    printf "\n\t%b\n" "${whiteb}++++++ IPINFO ++++++${end}"
    curl ipinfo.io/$1 || exit 1
    printf "\t%b\n" "${whiteb}++++++++++++++++++++${end}"
    printf "\n\n\t%b\n" "${whiteb}*********************${end}"
    printf "\t%b\n" "${whiteb}***** So WHAT ? *****${end}"
    printf "\t%b\n\n" "${whiteb}*********************${end}"

    read -p "SHOULD I BLACKLIST IT  (y/Y/o/O/n/N) ?!?" choice

    if [[ ! "$choice" =~ ^[yYoOnN]$ ]]; then
        printf "%b\n" "${redb}invalid choice${end}"
        exit 1
    fi

    if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "o" ] || [ "$choice" == "O" ]; then
        printf "%b\n" "${greenb}YOU PUT YES SO....${end}"
        sleep 1
        ip route add blackhole $1 || exit 1
        printf "%b\n" "${redb}NOW =>${end} $1 ${redb} IS BLACKLISTED !!!${end}"
    else
        printf "%b\n" "${greenb}Ok this ip will not be blocked${end}"
    fi
fi
