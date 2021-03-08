#!/bin/bash

sudo netstat -tunapl |
awk '/firefox/ {print $5}' |
#if [ $? == 0 ]
#then
cut -d: -f1 |
sort |
uniq -c |
sort |
tail -n 5 |
grep -oP '(\d+\.){3}\d+' |
while read IP
do
	whois $IP |
	if [ $? != 0 ] 
	then
		echo "whois isn't installed"
	else
		awk -F':' '/^Organization/ {print $2}'
	fi
done
#awk -F':' '/^Organization/ {print $2}'
	
#else
#	echo "No firefox"
#	exit 1
#fi
exit
