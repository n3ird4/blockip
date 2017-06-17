#!/bin/bash
# Author: n3ird4
# https://github.com/n3ird4/blockip.git 
# Sat 26 Nov 03:42:41 CET 2016
# Little script in order to make life (a bit) easier O_O 

#{{{ COLORS  
end='\033[0m'
white='\033[0;37m'
whiteb='\033[1;37m'
red='\033[0;31m'
redb='\033[1;31m'
green='\033[0;32m'
greenb='\033[1;32m'
#}}}

#{{{ CURL IPINFO and BLACKHOLE  

if [ -z "$1" ]
        then
                echo -e "${whiteb}GIMME AN IP ADRESS ILL LET U KNOW WHO U ARE :)${end}"
                exit 42
        else {
                echo -e "\n\t${whiteb}++++++ IPINFO ++++++${end}"
                curl ipinfo.io/$1
                echo -e "\t${whiteb}++++++++++++++++++++${end}"
                echo -e "\n\n\t${whiteb}*********************${end}"
                echo -e "\t${whiteb}***** So WHAT ? *****${end}"
                echo -e "\t${whiteb}*********************\n${end}"

                read -p "SHOULD I BLACKLIST IT  (yYoO/nN) ?!?" choice

                case "$choice" in
                        y|o|Y|O )
                                echo -e "${greenb}YOU PUT YES SO....${end}"
                                sleep 1
                                ip route add blackhole $1
                                echo -e "${redb}NOW =>${end} $1 ${redb} IS BLACKLISTED !!!${end}"
                                ;;
                        n|N )
                                echo -e "${greenb}Ok this ip will not be blocked${end}"
                                ;;
                        * ) echo -e "${redb}invalid choice${end}";;
                esac
        }
fi
#}}}
