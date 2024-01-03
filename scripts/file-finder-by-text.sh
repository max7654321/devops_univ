#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <text_to_search>"
    exit 1
fi

# directory path
directory="$1"
search_text="$2"

find "$directory" -type f -exec grep -l "$search_text" {} +

# Run command 
# ./find_text.sh path text