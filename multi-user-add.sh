#!/bin/bash
## Auhor: AbdulRahman Masri
## This script will creat multiple users with random generated psasword (16 char) via randpw function.

randpw() { < /dev/urandom tr -dc _'12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|  head -c${1:-16};echo;}


## Read the users from first Parameter (must be file) 
for i in $( cat $1) ;
    do 

    newpw=$(randpw)

    useradd "${i}" &> /dev/nul 

    if [ $? -eq 0 ]

      then :    # do nothing and go to line number 18#

      else echo "hufffft, User $i already exist *_* "
        continue
    fi

echo "${newpw}" |passwd  --stdin "${i}"  > /dev/null


echo -e  "password for $i: $newpw"
done
