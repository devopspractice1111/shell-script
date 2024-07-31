#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started execution $TIMESTAMP" &>> LOGFILE

VALIDATE() {
    if[ $1 -ne 0 ]
    then
        echo -e " $2... $R installing   failed $N"
    else
        echo -e " $2... $G installed succesfull $N"
    fi
}


if [ $ID -ne 0 ]
then
    echo " run u r script with root user"
    exit 1
else
    echo "go ahead u r root user"
fi


yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing mysql" &>> $LOGFILE

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git" &>> $LOGFILE
