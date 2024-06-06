#!/bin/bash

# Check if the user provided a file to print
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file-to-print>"
    exit 1
fi

# File to print
FILE_TO_PRINT="$1"

# Check if the file exists
if [ ! -f "$FILE_TO_PRINT" ]; then
    echo "File not found: $FILE_TO_PRINT"
    exit 1
fi

# Get the default printer name
DEFAULT_PRINTER=$(lpstat -d | awk '{print $4}')

# Check if a default printer is set
if [ -z "$DEFAULT_PRINTER" ]; then
    echo "No default printer set."
    exit 1
fi

# Print the document
lp -d "$DEFAULT_PRINTER" "$FILE_TO_PRINT"

echo "Document sent to printer: $DEFAULT_PRINTER"