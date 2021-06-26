#!/bin/bash
## Auhor: AbdulRahman Masri
## This script will creat multiple users with random generated psasword (16 char) via randpw function.

randpw() { < /dev/urandom tr -dc _'12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|  head -c${1:-16};echo;}
$date=date +"%m.%d.%Y"

## Read the users from first Parameter (must be file) 
for i in $( cat $1) ;
    do 

    newpw=$(randpw)

    useradd "${i}" &>> /tmp/muser-log-$date.log 

    if [ $? -eq 0 ]

      then :    # do nothing and go to line number 24#

      else echo "User $i already exist "
        continue
    fi

echo "${newpw}" |passwd  --stdin "${i}"  > /dev/null


echo -e  "password for $i: $newpw"
done
