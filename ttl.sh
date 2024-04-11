#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
verde="\e[32m"
cianNegritas="\e[1;36m"
sinColor="\e[0m"
read -p "Digita la IP: " ip
resultado=$(ping -c 1 ${ip} | grep -oE "ttl=[0-9]{2,3}" | sed s/"ttl=//g")
echo -e "la IP ${ip} tiene un ttl =$verde $resultado $sinColor"
echo -e "Es altamente probable que se trate de un SO$cianNegritas Windows $sinColor"
