#!/bin/bash

[[ $# -ne 2 ]] && echo " Usage: Two file arguments needed" && exit 1

MAX_SIZE=1048576 # max size of mooqita_challenge
FILE_SIZE=0 # initial size of file 
FILE=$1
FILE2=$2


# Create a series of random numbers and strings of characters and write them to a file
# While controlling the size of the file

while [[ $(($MAX_SIZE - $FILE_SIZE)) -ge 16 ]] # 16 because each line is 15 characters + newline
do
	# Read the urandom special file, and transform to alpanumeric string, and print only 15
	RAN_NUM_STR=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 15); echo $RAN_NUM_STR >> $FILE
	
	# Get file size
	FILE_SIZE=$(wc -c $FILE); FILE_SIZE=${FILE_SIZE%[[:blank:]]$FILE}
done

#sort the file
sort -o $FILE $FILE

# Remove all lines that start with an “a”, no matter if it is in uppercase or lowercase. 
# Safe the result into a new file.
grep -v "^[a|A].*" $FILE > $FILE2 

# How many lines were removed? 
NO_LINES_FILE=$(wc -l $FILE); NO_LINES_FILE=${NO_LINES_FILE%[[:blank:]]$FILE}
NO_LINES_FILE2=$(wc -l $FILE2); NO_LINES_FILE2=${NO_LINES_FILE2%[[:blank:]]$FILE2}

echo "Number of lines removed: $(($NO_LINES_FILE - $NO_LINES_FILE2))"
exit 0
