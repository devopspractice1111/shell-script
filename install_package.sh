#!/bin/bash

ID= $(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " $2... $R failed $N"
    else
        echo -e "$2... $G success $N"
    fi 
}

if [ $ID -ne 0 ]
then
    echo " u r not root user"
    exit 1
else
    echo "u r root user"
fi

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if[ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "installation of $package"
    else
        echo -e "$package already installed $Y skiiping $N"
    fi

done