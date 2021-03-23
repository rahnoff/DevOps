#!/bin/bash

# March of 2015
#FIRST_POINT=$(date +%s%3N -d "March 1, 2015 00:00:00") # 1425196800000 in epoch format
#SECOND_POINT=$(date +%s%3N -d "March 31, 2015 23:59:59") # 1427785200000 in epoch format
jq -r '.prices[][]' quotes.json |
awk 'ORS=NR%2?" ":"\n"' | 
awk '$1 >= 1425196800000 && $1 <= 1427785200000 { print $2 }' |
sort |
awk 'NR==1 { first = $0} END { print; print first}' |
awk 'ORS=NR%2?" ":"\n"' |
awk -v diff=0 '{diff=$1-$2} END { print diff }'
echo "The difference between the highest and lowest values in March 2015"


# March of 2016
#FIRST_POINT=$(date +%s%3N -d "March 1, 2016 00:00:00") # 1456819200000 in epoch format 
#SECOND_POINT=$(date +%s%3N -d "March 31, 2016 23:59:59") # 1459493999000 in epoch format
jq -r '.prices[][]' quotes.json |
awk 'ORS=NR%2?" ":"\n"' | 
awk '$1 >= 1456819200000 && $1 <= 1459493999000 { print $2 }' |
sort |
awk 'NR==1 { first = $0} END { print; print first}' |
awk 'ORS=NR%2?" ":"\n"' |
awk -v diff=0 '{diff=$1-$2} END { print diff }'
echo "The difference between the highest and lowest values in March 2016"


# March of 2017
#FIRST_POINT=$(date +%s%3N -d "March 1, 2017 00:00:00") # 1488355200000 in epoch format 
#SECOND_POINT=$(date +%s%3N -d "March 31, 2017 23:59:59") # 1491029999000 in epoch format
jq -r '.prices[][]' quotes.json |
awk 'ORS=NR%2?" ":"\n"' | 
awk '$1 >= 1488355200000 && $1 <= 1491029999000 { print $2 }' |
sort |
awk 'NR==1 { first = $0} END { print; print first}' |
awk 'ORS=NR%2?" ":"\n"' |
awk -v diff=0 '{diff=$1-$2} END { print diff }'
echo "The difference between the highest and lowest values in March 2017"


# March of 2018
#FIRST_POINT=$(date +%s%3N -d "March 1, 2018 00:00:00") # 1519891200000 in epoch format 
#SECOND_POINT=$(date +%s%3N -d "March 31, 2018 23:59:59") # 1522565999000 in epoch format
jq -r '.prices[][]' quotes.json |
awk 'ORS=NR%2?" ":"\n"' | 
awk '$1 >= 1519891200000 && $1 <= 1522565999000 { print $2 }' |
sort |
awk 'NR==1 { first = $0} END { print; print first}' |
awk 'ORS=NR%2?" ":"\n"' |
awk -v diff=0 '{diff=$1-$2} END { print diff }'
echo "The difference between the highest and lowest values in March 2018"


# March of 2019
#FIRST_POINT=$(date +%s%3N -d "March 1, 2019 00:00:00") # 1551427200000 in epoch format 
#SECOND_POINT=$(date +%s%3N -d "March 31, 2019 23:59:59") # 1554101999000 in epoch format
jq -r '.prices[][]' quotes.json |
awk 'ORS=NR%2?" ":"\n"' | 
awk '$1 >= 1551427200000 && $1 <= 1554101999000 { print $2 }' |
sort |
awk 'NR==1 { first = $0} END { print; print first}' |
awk 'ORS=NR%2?" ":"\n"' |
awk -v diff=0 '{diff=$1-$2} END { print diff }'
echo "The difference between the highest and lowest values in March 2019"


# March of 2020
#FIRST_POINT=$(date +%s%3N -d "March 1, 2020 00:00:00") # 1583049600000 in epoch format 
#SECOND_POINT=$(date +%s%3N -d "March 31, 2020 23:59:59") # 1585724399000 in epoch format
jq -r '.prices[][]' quotes.json |
awk 'ORS=NR%2?" ":"\n"' | 
awk '$1 >= 1583049600000 && $1 <= 1585724399000 { print $2 }' |
sort |
awk 'NR==1 { first = $0} END { print; print first}' |
awk 'ORS=NR%2?" ":"\n"' |
awk -v diff=0 '{diff=$1-$2} END { print diff }'
echo "The difference between the highest and lowest values in March 2020"
