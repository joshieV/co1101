# Author: Jason Reviewer: N-A
# Author StudentID: 269018964

set -u

# 1. Take the group name as the first argument ($1). If there isn't one, print a usage message and stop with exit 1.
if [ -z $1 ]; then # check if a value was passsed for the first argument
    echo "no groupname passed" # no value was passed print a usage message
    exit 1 # stop script
else
    echo "groupname passed: $1" # A value was passed
fi

# 2. Create a folder with that name. If it already exists, print a message and stop.
if [ -d $1 ]; then # Check if a folder with a name matching the variable exists 
    echo "folder: $1 exists" # folder exists print usage message
    exit 1 # stop script
else
    mkdir $1 # create folder with name matching first argument ($1)
    echo "folder $1 created"
fi

#3. Ask for member names one at a time until the user types done. Add each name to members.txt inside the folder (use a while loop and >>).

cd $1 # Change current working directory to the folder created with name matching first argument ($1)


touch members.txt # Create an empty text file

echo "Enter a name"
read name # assign user input to variable name
while [ $name != "done" ]; do # while user input is not "done" this loop will occur
    echo "$name" >> members.txt # concatenate user input to the text file
    echo "Enter a name"
    read name # assign user input to variable name
done

# 4. Show the file with cat and print how many members there are, using wc -l.

cat members.txt # Display contents of members.txt
echo "lines:"
wc -l members.txt # Show number of lines in members.txt

# 5. Copy the file to members_backup.txt, check that both files exist with -f, and list the folder.
cp members.txt members_backup.txt
if [ -f members.txt ]; then # Check if file with name members.txt exists
    echo "members.txt exists"
else
    echo "members.txt does not exist"
fi

if [ -f members_backup.txt ]; then # Check if file with name members_backup.txt exists
    echo "members_backup.txt exists"
else
    echo "members_backup.txt does not exist"
fi

ls

# 6. Add a line to log.txt in the folder with the date, using date (for example Created on <date>).

echo "$(date)" > log.txt 

# 7. Ask Delete everything? (y/n). If the answer is y, delete the files and the folder. Otherwise, print the folder path.
echo "Delete everything? (y/n)"
read choice # Get user input
if [ $choice == y ]; then # If user enters "y"
    cd .. # Change current working directory to parent foldder
    rm -r $1 # Delete the directory with name equal to value of $1 in the current working directory
else
    cd $1 # Change current working directory to directory with name equal to value of $1 in the current working directory
    pwd # Output the address/path of the current working directory
fi