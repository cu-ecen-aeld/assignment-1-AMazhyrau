#!/bin/bash

print_error_and_exit() {
    echo "Error: $1"
    exit 1
}

if [ $# -ne 2 ]; then
  echo "Usage: $0 <writefile> <writestr>"
  print_error_and_exit "Error: Invalid number of arguments, expected 2 required arguments"
fi

writefile="$1"
writestr="$2"

fpath=$(dirname "$writefile")

if ! mkdir -p "$fpath"; then
  print_error_and_exit "Error: the directory '$fpath' could not be created"
fi

if ! echo "$writestr" > "$writefile"; then
  print_error_and_exit "Error: file '$writefile' could not be created or written"
fi
