#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
sinColor="\e[0m"
negro="\e[30m"
rojo="\e[31m"
rojoNegrita="\e[1;31m"
verde="\e[32m"
amarillo="\e[33m"
azul="\e[34m"
morado="\e[35m"
cian="\e[36m"
blanco="\e[37m"
amNeg="\e[1;33m"
cianNegritas="\e[1;36m"
echo -e "${amNeg}######################################"
echo -e "##        ScanningTools             ##"
echo -e "##        by DanielCyberSec         ##"
echo -e "##	  nmapOpenPorts v2	    ##"
echo -e "######################################$sinColor"
#Validamos permisos
if [ $(id -u) -ne 0 ]; then
	echo -e "${rojoNegrita} Se requieren permisos elevados...${sinColor}"
exit
fi

echo "Comprobando que exista nmap en el equipo:"
if [ "$(echo $?)" == "0" ]; then
	echo -e "$(nmap --version | head -n 1 | awk '{print $1, $2, $3}') ............ [${verde} OK ${sinColor}]"
	sleep 1
	read -p "Digita la IP objetivo: " ip
	while true; do
		echo -e "$rojoNegrita 1$sinColor) Escaneo puertos abiertos, servicios y versiones (${rojoNegrita}lento pero sigiloso$sinColor)"
		echo -e "$rojoNegrita 2$sinColor) Escaneo puertos abiertos, servicios y versiones (${rojoNegrita}rápido pero ruidoso$sinColor)"
      		echo -e "$rojoNegrita 3$sinColor) Escaneo puertos abiertos (${rojoNegrita}lento pero sigiloso$sinColor)"
		echo -e "$rojoNegrita 4$sinColor) Escaneo puertos abiertos (${rojoNegrita}rápido pero ruidoso$sinColor)"
      		echo -e "$rojoNegrita 5$sinColor) Escaneo puertos abiertos con generación de archivos (${rojoNegrita}all$sinColor) (${rojoNegrita}rápido pero ruidoso$sinColor)"
		echo -e "$rojoNegrita 6$sinColor) Escaneo de vulnerabilidades en puertos abiertos de manera agresiva y generación de arhivo XML (${rojoNegrita}rapido y ruidoso$sinColor)"
      		echo -e "$rojoNegrita 7$sinColor) Salir"
		read -p "Seleccione una opción: " option
		case $option in
			1)
			echo "Escaneando puertos abiertos, servicios y versiones de manera sigilosa..."
                        echo -e "$(nmap -p- -sS -sV $ip | grep open)"
			exit
			;;
			2)
			echo "Escaneando puertos abiertos de manera rápida pero ruidosa..."
			echo -e "$(nmap -p- -sS -sV --min-rate 6000 $ip | grep open)"
			exit
			;;
			3)
			echo "Escaneando puertos abiertos de manera sigilosa..."
			echo -e "$verde$(nmap -p- -sS $ip | grep open | awk '{print $1}' | cut -d '/' -f 1 | xargs | tr ' ' ',')$sinColor"
			exit
			;;
			4)
			echo "Escaneando puertos abiertos rápido pero ruidoso..."
			echo -e "$verde$(nmap -p- -sS --min-rate 6000 -T5 $ip | grep open | awk '{print $1}' | cut -d '/' -f 1 | xargs | tr ' ' ',')$sinColor"
			exit
			;;
			5)
			echo "Escaneando puertos abiertos rápido y ruidoso, 6000 paquetes por segundo..."
                        echo -e "$verde$(nmap -p- -sS --min-rate 6000 $ip -oA openPorts | grep open | awk '{print $1}' | cut -d '/' -f)$sinColor"
			exit
			;;
			6)
			echo "Escaneo de vulnerabilidades en puertos abiertos + generación archivo XML..."
			read -p $'Digita los puertos abiertos ej. 100,200,300 (puedes copiarlos de la salida de la opción 3 o 4):\n' openPorts
			echo -e "$(nmap -p$openPorts -sV --script vuln -T4 -A -O $ip -oX openPorts.xml)"
			exit
			;;
			7)
			exit
			;;
		esac
	done
else
	echo "no hay nmap :("
	exit
fi
