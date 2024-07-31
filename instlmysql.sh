#!/bin/bash

ID=$(id -u)

if [ ID - ne 0 ]
then
    echo "please run this as root user"
    exit 1
else 
    echo " u are root user "
fi

yum install mysql -y


if [ $? - ne 0 ]
then
    echo "installing mysql failed"
    exit 1

else
    echo "installing mysql success"
fi