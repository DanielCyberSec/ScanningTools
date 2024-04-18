#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
rojoNegrita="\e[1;31m"
verde="\e[32m"
sinColor="\e[0m"
amNeg="\e[1;33m"
echo -e "${amNeg}######################################"
echo -e "##        ScanningTools             ##"
echo -e "##        by DanielCyberSec         ##"
echo -e "##	  dispositivosEnRed v2      ##"
echo -e "######################################$sinColor"
#Validamos permisos
if [ $(id -u) -ne 0 ]; then
        echo -e "${rojoNegrita} Se requieren permisos elevados...${sinColor}"
exit
fi

echo "Comprobando que exista nmap en el equipo:"
if [ "$(echo $?)" == "0" ]; then
        echo -e "$(nmap --version | head -n 1 | awk '{print $1, $2, $3}') ............ [${verde} OK ${sinColor}]"
	idRedCIDR=$(./miIdRed+CIDR.sh)
	miIP=$(./miIP.sh)
	echo -e "Mi IP:$verde $miIP $sinColor"
	echo -e "Mi idRed+CIDR:$verde $idRedCIDR $sinColor"
	echo "Dispositivos conectados:"
	echo -e "$verde$(sudo nmap -sP $idRedCIDR | grep for | awk '{print $5}')$sinColor"
fi
exit
