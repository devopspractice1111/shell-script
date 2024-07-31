#!/bin/bash

SOURCEDIR="/tmp/shell-script.logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d SOURCEDIR]
then
    echo -e "$R source dir $SOURCEDIR:: DOES NOT EXIST $N"
    exit 1
fi

FILESTODELETE=$(find $SOURCEDIR type -f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "deleting files:: $line"
    rm -rf $line
done <<< $FILESTODELETE