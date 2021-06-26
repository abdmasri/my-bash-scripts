#!/bin/bash

 randpw() { < /dev/urandom tr -dc _'12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|  head -c${1:-16};echo;}


for i in $( cat $1) ;
do 

userdel "${i}" &> /dev/nul 

if [ $? -eq 0 ]
then :
else
 echo "User $i is No deleted"
 break
fi

rm -rf /home/$i

echo -e  "user $i has been deleted"
done


