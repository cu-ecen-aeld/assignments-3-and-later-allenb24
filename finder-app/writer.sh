#!/bin/bash

# Check if we got 2 arguments
if [ $# -ne 2 ]
then
        echo "Error: parameters not entered correctly.
Acceptable format: finder.sh directory text"
        exit 1
fi

# Set argument variables
full_path=$1
directories=$(dirname "$full_path")
file=$(basename "$full_path")
text=$2
echo "Received arguments: ${full_path} ${text}"
echo "Extracted directory: ${directories}"
echo "Extracted filename: ${file}"

# If path doesn't exist, then create it
# We use the -p switch to enable creation of parent directories
if [ ! -d "${directories}" ]
then
        echo "Creating path..."
        mkdir -p "${directories}"
fi

echo ${text} >| ${full_path}
echo "Wrote to ${full_path}"

