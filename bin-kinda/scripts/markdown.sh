#! /usr/bin/zsh

filename="$1"

if [ -f $1 ]; then 
    echo exists
else 
    echo "file $1 does not exist"
    exit 1
fi

file_extension=$(echo "$filename" | rev | cut -d '.' -f 1 | rev)
if  [ "${file_extension}" != "md" ]; then 
    echo "file must be markdown"
fi

file_name=$(echo "$filename" | cut -d '.' -f 1)

rm .tmp.html
markdown $filename >> .tmp.html
wkhtmltopdf .tmp.html "$file_name.pdf"
rm .tmp.html



