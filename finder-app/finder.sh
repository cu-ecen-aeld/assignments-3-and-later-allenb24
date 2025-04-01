#!/bin/bash

# Check if we got 2 arguments
if [ $# -ne 2 ]
then
	echo "Error: parameters not entered correctly. Acceptable format: finder.sh directory text"
	exit 1
fi

# Set argument variables
directory=$1
text=$2
echo "Received arguments: ${directory} ${text}"

# Check if directory exists
if [ -d "${directory}" ]
then
	echo "Found directory ${directory}"
else
	echo "Error: Directory not found, exiting now..."
	exit 1
fi

# Set count variables #
# To count files, we grep with -l switch, which outputs each file that has the text.
# To count total matches of the text, we grep with -o switch.
## We then pipe these to wc (word count) and use switch -l (counts number of rows).
count_files=$(grep -r -l "${text}" ${directory} | wc -l)
count_matches=$(grep -r -o "${text}" ${directory} | wc -l)

echo "The number of files are ${count_files} and the number of matching lines are ${count_matches}"


