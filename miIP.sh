#!/bin/bash
#https://github.com/DanielCyberSec/ScanningTools.git
echo -e "$(ifconfig | grep inet | head -n 1 | awk '{print $2}')"
