#!/usr/bin/env bash

## tall.sh
# if $1 is a directory
#   Executes ttl on all files found recursively in the directory $1
# if $1 is a file
#   Executes ttl on that file

if [ -z "$1" ]; then
    echo "*************************************"
    echo "Recursively validate files with ttl."
    echo "*************************************"
    echo "USAGE:"
    echo -e "\t$0 file | folder"
    exit 1
fi

echo "Validating RDF in $1"

temp_file=$(mktemp)
printf "\n-------------------------------------------------------------\n" >> "$temp_file"
printf "Report on $1" >> "$temp_file"
printf "\n-------------------------------------------------------------\n" >> "$temp_file"
tel=0
fil=0

for file in $(find $1 -not -path '*/\.*')
do
    if [ -f $file ]; then
        fil=$((fil+1))
        echo "-- Validating $file"
        uit=$(ttl "$file")
        if [[ $uit == [Error:* ]]; then
            printf "$file\n" >> "$temp_file"
            printf "$uit\n\n" >> "$temp_file"
            tel=$((tel+1))
        fi
    fi
done
printf "_______________________________________________________________\n" >> "$temp_file"

if [ "$tel" -gt 0 ]; then
    echo "$(cat $temp_file)"
fi
echo
echo "Found $tel files with errors on a total of $fil files"
rm ${temp_file}

