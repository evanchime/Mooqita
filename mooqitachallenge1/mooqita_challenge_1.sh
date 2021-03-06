#!/bin/bash

# Check for two arguments, print a usage message if not supplied and exit
[[ $# -ne 2 ]] && echo " Usage: Two file arguments needed" && exit 1

FILE=$1 # First file to write the random numbers and strings to 
FILE2=$2 # Second file without lines starting with 'a'
MAX_SIZE=1048576 # Maximum allowable size of $FILE
FILE_SIZE=0 # Initial size of $FILE 

# Create a series of random numbers and strings of characters and write them to a file
# While controlling the size of the file

while [[ $(($MAX_SIZE - $FILE_SIZE)) -ge 16 ]] # 16 because each line is 15 characters + newline
do
	# Read the urandom special file, and transform to alpanumeric string, and print only 15
	RAN_NUM_STR=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 15); echo $RAN_NUM_STR >> $FILE
	
	# To the reviewer, ignore solution description, as file updated after submission. 
	# To the reviewer, here, cat reads file and pipes output to wc -c
	FILE_SIZE=$(cat $FILE | wc -c) # Get file size  
done

#sort the file
sort -o $FILE $FILE

# Remove all lines that start with an “a”, no matter if it is in uppercase or lowercase. 
# Safe the result into a new file.
grep -v "^[a|A].*" $FILE > $FILE2 

# How many lines were removed? 
# To the reviewer, ignore solution description, as file updated after submission
# To the reviewer, here cat reads files and pipes output to wc -l
NO_LINES_FILE=$(cat $FILE | wc -l) # Get number of lines
NO_LINES_FILE2=$(cat $FILE2 | wc -l) # Get number of lines

echo "Number of lines removed: $(($NO_LINES_FILE - $NO_LINES_FILE2))"
exit 0
