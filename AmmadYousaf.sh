read -p "Enter path of directory: " path

read -p "Enter pattern of regular expression to match: " pattern

function change_in_file {

file_name=$1

if grep -q "string" "$file_name"; then

awk '/string/ {print $1, $2}' "$file_name"

fi

}

inotifywait -m -e create -e modify -e delete "$path" | while read file_name; do

if [[ "$file_name" =~ $pattern ]]; then

change_in_file "$file_name"

fi

done
