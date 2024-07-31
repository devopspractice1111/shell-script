#!/bin/bash

NUMBER=$1

if [ $NUMBER - gt 100 ]
then
    echo "then given $NUMBER IS GREATER THAN 100"
else
    echo "the given $NUMBER IS LT THAN 100"
fi