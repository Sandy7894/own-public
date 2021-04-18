#!/bin/bash

#Creating the input file
touch inputfile && chmod 755 inputfile
>inputFile

printf "Date \t\t\t\t BitCoin current price\n"  >> inputfile

while true;
do
	date=`date`
	curPrice=`curl -k -s https://api.coindesk.com/v1/bpi/currentprice.json | jq -r ".bpi.USD.rate"`
	#Printing the data to a file

	echo -e "${date}\t ${curPrice}" >> inputfile
	sleep 1;
done

