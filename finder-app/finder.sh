#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Error: Invalid number of arguments, expected 2 required arguments."
  echo "Example: $0 <filesdir> <searchstr>"
  exit 1
fi

filesdir="$1"
searchstr="$2"

if [ ! -d "$filesdir" ]; then
  echo "Error: '$filesdir' is not a directory on the filesystem."
  exit 1
fi

fcount=$(find "$filesdir" -type f | wc -l)

lcount=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $fcount and the number of matching lines are $lcount"

