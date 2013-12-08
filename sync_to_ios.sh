#!/bin/sh

HOST=$1
if [ -x ${HOST} ]; then
	echo "Usage: $0 <hostname>"
	exit;
fi
cd DCIM
echo "When prompted, enter the root password of your iOS device."
rsync -av -e ssh * root@${HOST}:/var/mobile/Media/DCIM/
