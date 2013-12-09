#!/bin/sh

HOST=$1
if [ -x ${HOST} ]; then
	echo "Usage: $0 <hostname/IP of your iOS device>"
	exit;
fi
echo "When prompted, enter the mobile password of your iOS device (default is alpine)."
rsync -zarv -e ssh --include="*/" --include="*.JPG" --exclude="*" mobile${HOST}:/var/mobile/Media/DCIM .
