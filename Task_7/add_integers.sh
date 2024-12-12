#!/usr/bin/bash

# Pass Two Integrs as Arguments
Integers=$2

# if Valid Calculate the Sum of the Two Integers
if [[ "$Integers" ]]; then
    Result=$(($1+$2))  
    # Display the Output
    echo "Result = $Result"
else
    # if Validation faild, Output an Error Message and Exit
    echo "You Must Pass the Both Integrs"
    exit
fi