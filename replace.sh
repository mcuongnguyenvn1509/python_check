#!/bin/bash
DIR="$1"
usage="$(basename "$0") [-h] [-m] -- program to calculate the answer to life, the universe and everything

where:
    -h  show this help text
    -a  replace auto generated code
    -m  rplace manual code

while getopts ':hs:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    m) replace_manual()
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

file=domains.txt
replace_generated() {
	 # set the Internal Field Separator to |
 IFS='|'
 while read -r line ID name solution
 do
         [[ "$line" =~ ^#.*$ ]] && continue
         ID=$(echo $ID | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "***Reading %s to repalce the source code...\n" $ID
         name=$(echo $name | sed 's/^[ \t]*//;s/[ \t]*$//')
         solution=$(echo $solution | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "\"%s\" replacing by \"%s\" ...\n" $name $solution
         #find $arg -type f | xargs sed -i "s/\b${original}\b/${new}/gi" ;
	 grep -rwl "Generated file" $DIR --include=*.{cpp,h}| xargs sed -i "s/\b${original}\b/${new}/gi" ;
 	 done < "$file"
}
replace_manual() {
	 # set the Internal Field Separator to |
 IFS='|'
 while read -r line ID name solution
 do
         [[ "$line" =~ ^#.*$ ]] && continue
         ID=$(echo $ID | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "***Reading %s to repalce the source code...\n" $ID
         name=$(echo $name | sed 's/^[ \t]*//;s/[ \t]*$//')
         solution=$(echo $solution | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "\"%s\" replacing by \"%s\" ...\n" $name $solution
         #find $arg -type f | xargs sed -i "s/\b${original}\b/${new}/gi" ;
	 grep -rwl "Generated file" $DIR --include=*.{cpp,h}| xargs sed -i "s/\b${original}\b/${new}/gi" ;
 	 done < "$file"
}

replace_generated()

