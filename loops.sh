#!/bin/bash
# Author: Reyhan
# Reviewer: Joshua
# Student ID: 249021606

# Review:
# Overall the code is good. However, there are a few things that can be improved.
#
# 1. Input validation:
#    The script does not validate the input after `read -p`. If the user enters
#    a non-numeric value or leaves it blank, the arithmetic expansions will fail.
#    Consider adding a check such as:
#        [[ $n =~ ^[0-9]+$ ]] || { echo "Please enter a positive integer"; exit 1; }
#
# 2. Factorial calculation:
#    The logic is correct, but note that inside (( )) and $(( )) the $ prefix is
#    not required, e.g. (( i <= n )) is valid and more idiomatic.
#
# 3. Prime number check:
#    `echo "Not a prime number"` is printed for every non-prime i, which floods
#    the output and makes it hard to read. Since the task is to print the prime
#    numbers, the inner loop should simply `break` without printing:
#        if (( i % j == 0 )); then
#            is_prime=0
#            break
#        fi
#    Optionally, the inner loop only needs to check divisors up to i/2
#    (or j*j <= i) for efficiency.

# 1. Print the multiplication table from 1 to n, one row per line (use a loop inside a loop).
read -p "Enter a number n: " n # Asks the user to input a number

for (( i = 1; i <= n; i++ )); do 
    for (( j = 1; j <= n; j++ )); do # Nested for loop
        printf "%5d" $(( i * j )) # Prints the multiplication table
    done
    echo
done

# 2. Print n factorial (n!) using a loop. If n is more than 10, print a message instead.
if [ $n -gt 10 ]; then
    echo "Please enter a number less than or equal to 10." # This message will be printed instead if the user inputs a number > 10
else
    factorial=1
    for (( i = 1; i <= n; i++ )); do
        factorial=$(( factorial * i )) # Calculates the factorial of n
    done
    echo "The factorial of $n is $factorial" # Prints the factorial of n
fi

# 3. Print all prime numbers from 2 to n (use a loop inside a loop and test divisors with %)
for (( i = 2; i <= n; i++ )); do # Loops through 2 to n, as prime numbers start from 2
    is_prime=1
    for (( j = 2; j < i; j++ )); do # Checks if i is divisible by 2 or any other number < i
        if (( i % j == 0 )); then # If i is divisible by j, then it is not prime
            is_prime=0
            echo "Not a prime number" # This prints if i is not prime
            break
        fi
    done
    if [ $is_prime -eq 1 ]; then
        echo "$i is a prime number" # This prints if i is prime
    fi
done