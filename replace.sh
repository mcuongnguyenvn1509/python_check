#!/bin/bash
DIR="$1"

file=domains.txt

# set the Internal Field Separator to |
 IFS='|'
 while read -r line ID new solution
 do
         [[ "$line" =~ ^#.*$ ]] && continue
         ID=$(echo $ID | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "***Reading %s to repalce the source code...\n" $ID
         new=$(echo $new | sed 's/^[ \t]*//;s/[ \t]*$//')
         solution=$(echo $solution | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "\"%s\" replacing by \"%s\" ...\n" $new $solution
         #find $arg -type f | xargs sed -i "s/\b${original}\b/${new}/gi" ;
	 grep -rwl "Generated file" $DIR --include=*.{cpp,h}| xargs sed -i "s/\b${original}\b/${new}/gi" ;
 	 done < "$file"


