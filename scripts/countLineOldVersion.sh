#! /bin/bash

fileExt="*.$1"

allFiles=$(find ./ -name $fileExt)

commentLines=$((perl -ne 'print "$1\n" while /(^\s+\/\/\s*\w+)/sg' $allFiles;\
perl -0777 -ne 'print "$1\n" while /(\*\*.*?\*\/)/sg' $allFiles) | wc -l)

blankLines=$(grep '^[[:space:]]*$' -r --include $fileExt | wc -l)
allLines=$(echo $allFiles | xargs wc -l | tail -n 1 | cut -d " " -f 2)

echo -e "\nTotal comments line is: $commentLines.\n\
Total blank lines is: $blankLines.\n\
\nTotal all lines is: $allLines."
