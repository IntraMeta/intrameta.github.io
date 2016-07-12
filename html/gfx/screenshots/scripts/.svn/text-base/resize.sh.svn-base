#!/bin/bash
# @author Stephen Shelton

test -e backup
if [ $? != "0" ]; then
    mkdir backup
fi

for f in *; do
    w=`identify -format %w $f`
    h=`identify -format %h $f`

    if [ $? -ne "0" ]; then
	echo "$f fail"
	continue
    else 
	if  [ $w -gt 900 ]; then
	    cp $f backup/

	    convert $f -resize 75% $f
	    # ratio="0.75"
	    # neww=`echo "scale=0; $w * $ratio" | bc -l`
	    # newh=`echo "scale=0; $h * $ratio" | bc -l`

	    # echo "$f: ${w}x${h} -> ${neww}x${newh}"

	fi
    fi
done


