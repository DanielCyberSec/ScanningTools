#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
amNeg="\e[1;33m"
verde="\e[32m"
sinColor="\e[0m"
cianNegritas="\e[1;36m"
echo -e "${amNeg}######################################"
echo -e "##        ScanningTools             ##"
echo -e "##        by DanielCyberSec         ##"
echo -e "######################################$sinColor"
read -p "Digita la IP: " ip
resultado=$(ping -c 1 ${ip} | grep -oE "ttl=[0-9]{2,3}" | sed s/"ttl=//g")
echo -e "la IP ${ip} tiene un ttl =$verde $resultado $sinColor"
if [ $resultado == 128 ]; then
	echo -e "Es altamente probable que se trate de un SO$cianNegritas Windows $sinColor"
elif [ $resultado == 64 ]; then
	echo -e "Es probable que se trate de un SO$amNeg Linux $sinColor"
else
	echo "ttl unknown"
exit
fi
