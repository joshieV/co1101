#!/bin/bash
#Author: Joshua Reviewer: 
#student ID: 

#set -u checks if the variable is set or not. If its not set it will throw an error and exit the script
set -u

#this helper function prints the result of the calculation in a formatted way
print_result() {
     printf " %-12s : %s\n" "$1" "$2"
}

if [ $# -ne 2 ]; then #Checks if the number of arguments is not equal to 2
    echo "Error: Two argments are needed" 
    exit 1
fi

for arg in "$1" "$2"; do
    case "$arg" in
        ''|*[!0-9]*) #Checks if the any of the arguments are not numbers and throws an error and exits the script
            echo "Error: Argument $arg is not a number"
            exit 1
            ;;
    esac
done

num1=$1
num2=$2

#outputs the ressult of the calculation based on the operation performed
print_result "Sum" $(expr "$num1" + "$num2")
print_result "Difference" $(expr "$num1" - "$num2")
print_result "Product" $(expr "$num1" \* "$num2")

#division by zero check, checks if the second number isnt 0 since if you divide by 0 its undefined and will throw an error
if [ "$num2" -eq 0 ]; then
    print_result "Quotient" "Undefined (division by zero)"
    print_result "Remainder" "Undefined (division by zero)"
else
    print_result "Quotient" $(expr "$num1" / "$num2")
    print_result "Remainder" $(expr "$num1" % "$num2")
fi

#Comparason check to see which is largfer and which is smaller, if they are equal it will output that they are equal
if [ "$num1" -gt "$num2" ]; then
    print_result "Comparason" "$num1 is greater than $num2"
elif [ "$num1" -lt "$num2" ]; then
    print_result "Comparason" "$num1 is less than $num2"
else
    print_result "Comparason" "$num1 is equal to $num2"
fi

#parity to see if num1 is even or odd
if [ $((num1 % 2)) -eq 0 ]; then
    print_result "Parity" "$num1 is even"
else
    print_result "Parity" "$num1 is odd"
fi
#parity to see if num2 is even or odd
if [ $((num2 % 2)) -eq 0 ]; then
    print_result "Parity" "$num2 is even"
else
    print_result "Parity" "$num2 is odd"
fi

#GCD calculation using Euclidean algorithm
x="$num1"
y="$num2"

while [ "$y" -ne 0 ]; do
    remainder=$(expr "$x" % "$y")
    x="$y"
    y="$remainder"
done

print_result "GCD" "$x"