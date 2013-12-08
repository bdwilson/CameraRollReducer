#!/bin/sh


# last time that you ran this tool on your photos
DATE=$1

if [ -x ${DATE} ]; then
	echo "Usage: $0 <yyyy-mm-dd> where date is the last time you ran the tool"
	exit;
fi 
find DCIM -name "*.JPG" -newermt ${DATE} -exec mogrify -quality 80 {} \;

