#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git

#importamos el scrips
#. $miIdRed+CIDR.sh
#. $miIP.sh
#Validamos permisos
rojoNegrita="\e[1;31m"
verde="\e[32m"
sinColor="\e[0m"

if [ $(id -u) -ne 0 ]; then
        echo -e "${rojoNegrita} Se requieren permisos elevados...${sinColor}"
exit
fi

echo "Comprobando que exista nmap en el equipo:"
if [ "$(echo $?)" == "0" ]; then
        echo -e "$(nmap --version | head -n 1 | awk '{print $1, $2, $3}') ............ [${verde} OK ${sinColor}]"
        sleep 3
        clear
	idRedCIDR=$(./miIdRed+CIDR.sh)
	miIP=$(./miIP.sh)
	echo Mi IP: $miIP
	echo Mi idRed+CIDR: $idRedCIDR
	echo Dispositivos conectados:
	echo -e "$verde$(sudo nmap -sP 192.168.100.0/24 | grep for | awk '{print $5}')$sinColor"
fi
exit
