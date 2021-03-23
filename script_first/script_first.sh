#!/bin/bash

# netstat shows tcp and udp connections
sudo netstat -tunapl |
# awk procceses only lines with firefox word and prints the fifth column
awk '/firefox/ {print $5}' |
cut -d: -f1 |
sort |
uniq -c |
sort |
tail -n 5 |
grep -oP '(\d+\.){3}\d+' |
# read command reads output of grep, assigns it to IP variable
while read IP
do
	whois $IP |
	if [ $? != 0 ]        # $? - return code of the preceeding command
	then
		echo "whois isn't installed"
	else
		awk -F':' '/^Organization/ {print $2}'
	fi
done
exit
