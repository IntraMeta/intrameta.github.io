#!/bin/bash
# @author Stephen Shelton
# Modified by Kris Efland
# This is based on Stephen's original script but makes a thumbnail as well.
# 
# The original screenshots used with this script started out at 1026x749

test -e backup
if [ $? != "0" ]; then
    mkdir backup
fi

for f in *; do
    w=`identify -format %w $f`
    h=`identify -format %h $f`

    if [ $? -ne "0" ]; then
	echo "FAIL: Unknown file $f"
	continue
    else 
	if  [ $w -gt 900 ]; then
	    cp $f backup/

	    # First make our thumbnail
	    echo "   $f :: Thumbnail"
	    convert $f -resize 15% thumb_$f

	    # Now make our slightly smaller image as the full screen shot
	    echo "   $f :: Web Image"
	    convert $f -resize 75% $f

	    # ratio="0.75"
	    # neww=`echo "scale=0; $w * $ratio" | bc -l`
	    # newh=`echo "scale=0; $h * $ratio" | bc -l`

	    # echo "$f: ${w}x${h} -> ${neww}x${newh}"

	fi
    fi
done


