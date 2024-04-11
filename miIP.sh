#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
verde="\e[32m"
sinColor="\e[0m"
echo -e "$verde$(ifconfig | grep inet | head -n 1 | awk '{print $2}')$sinColor"
