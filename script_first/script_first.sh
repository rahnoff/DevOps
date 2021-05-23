#!/bin/bash

# netstat shows tcp and udp connections
E_NOARGS=75
if [ -z "$1" ]
then
	echo "Usage: `basename $0` firefox or `basename $0` 5000"  #Process ID or name isn't specified, pls enter like firefox or 6457
	exit $E_NOARGS
else
	sudo netstat -tunapl |
        awk -v pid="$1" '$0~pid {print $5}' |
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
			exit 1
		else
		        awk -F':' '/^Organization/ {print $2}'
			exit 0
		fi
	done
fi
