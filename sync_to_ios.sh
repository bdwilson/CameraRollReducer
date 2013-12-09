#!/bin/sh

HOST=$1
if [ -x ${HOST} ]; then
	echo "Usage: $0 <hostname>"
	exit;
fi
cd DCIM
echo "When prompted, enter the mobile password of your iOS device (default is alpine)."
rsync -av -e ssh * mobile@${HOST}:/var/mobile/Media/DCIM/

