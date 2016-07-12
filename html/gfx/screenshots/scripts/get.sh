#!/bin/bash

if [ "$1" = "" ]
then
    echo "usage: sh get.sh <screenshot prefix> <number of screenshots to capture>"
    exit 1;
fi

if [ "$2" = "" ]
then
    echo "usage: sh get.sh <screenshot prefix> <number of screenshots to capture>"
    exit 1;
fi

for ((i=1; i<=$2; i+=1)); 
do
	wget -q http://stageweb.intrameta.com/gfx/ss/${1}${i}_thumb.png;
	if [ $? = "0" ];
	then
		echo "${1}${i}_thumb.png: success"
	else
		echo "${1}${i}_thumb.png: fail"
	fi

	wget -q http://stageweb.intrameta.com/gfx/ss/${1}${i}.png;
	if [ $? = "0" ];
	then
		echo "${1}${i}.png: success"
	else
		echo "${1}${i}.png: fail"
	fi
done

