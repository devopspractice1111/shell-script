#!/bin/bash

ID=$(id -u)

VALIDATE() {
    if [ $1 - ne 0]
    then
        echo " installing $2 is failure"
        exit 1
    else 
        echo "installing $2 success"
    fi
}

if [ $ID - ne 0]
then
    echo "please run u r script with root user"
    exit 1
else 
    echo " u go ahead u r root user"
fi

yum install mysql -y

VALIDATE $? "installing mysql"

yum install git -y

VALIDATE $? "installing git"