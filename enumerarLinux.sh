#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
rojoNegrita="\e[1;31m"
verde="\e[32m"
sinColor="\e[0m"
amNeg="\e[1;33m"
echo -e "${amNeg}######################################"
echo -e "##        ScanningTools             ##"
echo -e "##        by DanielCyberSec         ##"
echo -e "######################################$sinColor"
echo -e "\n--- Sistema Operativo ---"
uname -a
echo -e "\n--- Distribución de linux ---"
lsb_release -a 2>/dev/null
echo -e "\n--- Kernel ---"
uname -r
echo -e "\n--- Disco ---"
df -h
echo -e "\n--- Interfaces de red ---"
ip a | awk '/^[0-9]+: / {iface=$2} /inet / {print iface, $2}'
echo -e "\n--- Conexiones de red activas ---"
ss -tuln
echo -e "\n--- Archivo hosts ---"
cat /etc/hosts
echo -e "\n--- Archivo resolv.conf ---"
cat /etc/resolv.conf
echo -e "\n--- Binarios con permisos SUID ---"
find / -perm -4000 2>/dev/null
echo -e "\n--- Comandos que se pueden ejecutar con sudo ---"
sudo -l
