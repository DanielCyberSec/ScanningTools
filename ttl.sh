#!/bin/bash
read -p "Digita la IP: " ip
resultado=$(ping -c 1 ${ip} | grep -oE "ttl=[0-9]{2,3}" | sed s/"ttl=//g")
echo -e "la siguiente IP ${ip} tiene un ttl = \e[32m$resultado"
