#!/bin/bash
## Auhor: AbdulRahman Masri
## This script will creat multiple users with random generated psasword (16 char) via randpw function.

randpw() { < /dev/urandom tr -dc _'12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|  head -c${1:-16};echo;}
date_var=$(date +"%m.%d.%Y")
time_var=$(date +"%T")

echo "Begin $time_var" >> /tmp/muser-log-$date_var.log
## Read the users from first Parameter (must be file) 
for i in $( cat $1) ;
do 
newpw=$(randpw)

    if [[ "${UID}" -eq 0 ]]
        then   

         useradd "${i}" &>> /tmp/muser-log-$date_var.log 
        else 
         echo "you require root privilege"
         exit 1 
    fi
    if [ $? -ne 0 ]
      then 
       echo "User $i already exist -- check error logs"
       continue
    fi

echo "${newpw}" |passwd  --stdin "${i}"  >> /tmp/muser-log-$date_var.log 
echo -e  "password for $i: $newpw"

done
echo -e  "END $time_var\n\n" >> /tmp/muser-log-$date_var.log
