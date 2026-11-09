#Author: Joshua
#Author Student ID: 269027194 

# co1101 (Group assignment)

We have made 4 scripts being: files.sh, calc.sh, loops.sh and menu.sh. 

**Stack:** 
- bash

## What's implemented

- files.sh - Takes a group name as the first argument, creates a folder for it, asks for member names one at a time (until done) and saves them to members.txt. It then shows the file with cat, counts the members with wc -l, makes a backup copy (members_backup.txt), checks both files exist, and lists the folder. It logs the creation date to log.txt, then asks whether to delete everything.
- calc.sh - Takes two whole numbers as arguments, validates that they are whole numbers, and uses expr to print the sum, difference, product, quotient and remainder (skipping division if the second number is 0). It also says which number is larger (or that they are equal), whether each is even or odd, and finds the GCD with a while loop.
- loops.sh - Asks for a number n, then prints the multiplication table from 1 to n (nested loops), calculates n! (with a message if n > 10), and prints all prime numbers from 2 to n.
- menu.sh - Shows a menu repeatedly until the user quits. Each option runs a function holding the code from the matching script, and every action appends a dated line to session.log. Invalid choices print Invalid choice and show the menu again. On quit, it asks whether to delete session.log.

## Running the scripts

Save all four scripts in the same folder, then open a terminal in that folder.

Make the scripts executable
```
chmod +x files.sh calc.sh loops.sh menu.sh
```

To run the scripts
```
./files.sh $1
./calc.sh $1 $2
./loops.sh $1
./menu.sh
```
$1 is the groupname for files.sh
$1 and $2 are the arguments of your choice for calc.sh