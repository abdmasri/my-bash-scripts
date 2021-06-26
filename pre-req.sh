#!/bin/bash

# Regular Colors
BRed='\033[1;31m'  
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
NC="\033[0m" # No Color

if [[ "${UID}" -eq 0 ]]
    then   
yum update -y && yum -y install epel-release wget bash-completion && yum install -y htop screen bash-completion-extras net-tools vim yum-utils bind-utils traceroute 

else 
    echo "you are not root"
    exit 1 
fi
setenforce 0

sed  -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

echo  -e "${BRed}\n###############################\n"
echo "please Reboot your server"
echo -e "\n###############################\n ${NC}"


