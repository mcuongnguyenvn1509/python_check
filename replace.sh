 #!/bin/bash
 [ $# -eq 0 ] && { echo "Usage: $0 PATH_TO_FOLDER"; exit 1; }
 arg="$1"

 file=./domain.txt
 # set the Internal Field Separator to |
 IFS='|'
 while read -r ID original new
 do
         [[ "$ID" =~ ^#.*$ ]] && continue
         ID=$(echo $ID | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "***Reading %s to repalce the source code...\n" $ID
         original=$(echo $original | sed 's/^[ \t]*//;s/[ \t]*$//')
         new=$(echo $new | sed 's/^[ \t]*//;s/[ \t]*$//')
         printf "\"%s\" is being replaced by \"%s\" ...\n" $original $new
         #find $arg -type f | xargs sed -i "s/\b${original}\b/${new}/gi" ;
         grep -rwl "Generated file" $arg --include=*.{h,cpp} | xargs sed -i "s/\b${original}\b/${new}/gi" ;
 done < "$file"
