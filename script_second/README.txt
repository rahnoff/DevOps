
date +%s%3N -d "Month Day, Year TIME" - turns date into epoch time in milliseconds format

jq -r '.prices[][]' - outputs json type of data into strings

awk 'ORS=NR%2?" ":"\n"' - formats strings into two columns

awk '$1 >= epoch time && $1 <= epoch time { print $2 }' - print lines only in range

sort - sort from the lowest to highest

awk 'NR==1 { first = $0} END { print; print first }' - print only the first and last values

awk -v diff=0 '{diff=$1-$2} END { print diff }' - print the difference between them
