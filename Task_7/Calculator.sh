#!/usr/bin/bash

# Pass the Operation
echo "Choose the Operation: " 
echo "1- Add Operation" 
echo "2- Subtract Operation" 
echo "3- Multiplication Operation" 
echo "4- Divide Operation" 
read operation

# ensure the Operation is valid
if [[ "$operation" ]]; then
    # Pass Two Integrs
    echo "Enter First Number = " 
    read Num1
    echo "Enter Second Number = " 
    read Num2

    # ensure the Two Integers are valid
    if [[ "$Num1" && "$Num2" ]]; then
        if [[ "$operation" == 1 ]]; then
        Result=$((Num1+Num2))
        elif [[ "$operation" == 2 ]]; then
            Result=$((Num1-Num2))
        elif [[ "$operation" == 3 ]]; then
            Result=$((Num1*Num2))
        elif [[ "$operation" ==  4 ]]; then
            if [[ "$Num2" == 0 ]]; then # Check the Denominator for Division
                echo "The Denominator Must not Equals 0"
                exit
            else
                Result=$((Num1/Num2))
            fi
        fi
    else
        # if Validation faild, Output an Error Message and Exit
        echo "You Must Pass the Both Integrs"
        exit
    fi

else
    # if Validation faild, Output an Error Message and Exit
    echo "You Must Pass the Desire Operation"
    exit
fi

# Display the Output
echo "Result = $Result"