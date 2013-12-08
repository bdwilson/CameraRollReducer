iOS Camera Roll Reducer / Space Saver
=============================================
<br>
A series of shell scripts that sync the camera roll from your jailbroken iOS
device to a
local Mac/Linux machine, reduce the quality, then sync them back to the camera
roll. Unfortunately, this cannot be done on the iOS device itself because
ImageMagick is not compiled with jpeg support. I've bugged [@saurik](https://github.com/saurik) about it.

<b>This process will modify your camera roll images on your iOS device. It is
advised that
you sync your camera roll via other means prior to doing this, either by using
iCloud, Dropbox, or some other solution like PhotoSync.  You have been warned!
</b>

Requirements
------------
 - A Jailbroken iOS device
 - ImageMagick
     - On Linux, install ImageMagick from from your OS repo. For Mac, I'd
          suggest installing it via [Homebrew](https://github.com/mxcl/homebrew)
 - rsync
     - Install this on BOTH Mac/Linux side (again, via your OS repo or
       Homebrew) AND on iOS via Cydia.
 - openssh
     - Install this on iOS (and [change the
       passwords](http://www.jailbreakqa.com/questions/13894/how-can-i-change-my-ios-password) or uninstall it when you
       are done) via Cydia.


Usage
-----

Make sure SSH is installed on your iOS device and that rsync is installed via
Cydia. Make sure the receiving end (Mac/Linux) also has rsync and Imagemagick
installed.  Type <pre>mogrify -version</pre> to make sure ImageMagick/mogrify
is installed if you're unsure.

On the receiving end, make sure there is enough space to receive all the images
from your iOS device, then issue the following:

<pre>
$ ./sync_from_ios.sh 192.168.1.123
</pre>

When prompted, enter the password for root on your iOS device (hopefully not
the default (alpine).

It should take awhile depending on how many photos you have. Only JPG photos
will be synced (no Movies or screenshots - PNG's).

You can type 'du' to see how much space is currently taken up:
<pre>
$ du -sh DCIM
</pre>

At this point, <b>if you'd like to make a backup of your images locally so you
can experiment with different quality settings, then you can backup the DCIM
directory.</b>

<pre>
$ cp -Rp DCIM DCIM.orig
</pre>

Once complete, you can then run mogrify.sh.  If you want to adjust the quality
to be more than 80%, then you can modify this script first.  100 is what the
image is now, so you need to go less than 100.  Mogrify *requires* an argument
of the last time you ran the tool, so if you've never run it, then use a date
like "2000-01-01".  This is so you can run the tool several times against the
same device without reducing the quality of images you've already modified, so
keep track of the dates when you run the tool on each device you use it on. <b>
This process will ALTER the photos you just synced to your local disk.</b>

<pre>
$ ./mogrify.sh 2000-01-01
</pre>

This will take awhile to run depending on how many images need to be processed.

When mogrify is done, then you can see how much space is taken up after the
quality adjustments:

<pre>
$ du -sh DCIM
</pre>

If you are satisfied with the results, you can then sync your altered images
back to your iOS device. Image sizes are typically cut at least in <i>half</i>
or more when reducing to 80% quality. This reduction is not noticable on a
mobile device. <b> WARNING: You are getting ready to modify the images that
exist on your iOS device. You should have already backed-up these files in case
something goes wrong.</b>

<pre>
$ ./sync_to_ios.sh 192.168.1.123
</pre>

When this completes, open up the Camera Roll on your device to see if you can
notice any changes (you won't). If you are satisfied, you can remove the DCIM
(and DCIM.orig if you made a backup) directories. 

<pre>
$ rm -rf DCIM*
</pre>

<i><b>It would also be good to make a note of the date when you run this so you
can run it again in the future.</i></b>

<b> If you installed SSH on iOS just for this purpose, go uninstall it or
change your
[passwords](http://www.jailbreakqa.com/questions/13894/how-can-i-change-my-ios-password).

Bugs/Contact Info
-----------------
Bug me on Twitter at [@brianwilson](http://twitter.com/brianwilson) or email me
[here](http://cronological.com/comment.php?ref=bubba).

