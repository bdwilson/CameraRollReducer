#!/bin/sh

HOST=$1
if [ -x ${HOST} ]; then
	echo "Usage: $0 <hostname/IP of your iOS device>"
	exit;
fi
echo "When prompted, enter the root password of your iOS device."
rsync -zarv -e ssh --include="*/" --include="*.JPG" --exclude="*" root@${HOST}:/var/mobile/Media/DCIM .
