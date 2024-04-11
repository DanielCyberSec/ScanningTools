#!/bin/bash
#Funcionamiento: descubre el id de red y si la mascara es 255.255.255.0, coloca el CIDR /24 al final de la IP
#Objetivo: la salida sive como parametro para los escaneos de nmap, ejemplo: sudo nmap -sP <salidaDeEsteScript>
verde="\e[32m"
sinColor="\e[0m"

idRed=$(route | tail -n 1 | awk '{print $1}')
mascara=$(route | tail -n 1 | awk '{print $3}')
if [ $mascara == 255.255.255.0 ]; then
	echo -e "$verde $idRed/24 $sinColor"
fi
exit
