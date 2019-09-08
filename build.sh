#!/bin/sh
if [ -z $1 ]
then
   fn=chargen
else
   fn=$1
fi
sed '/^[[:space:]]*$/d;s/\\/0/g;s/@/1/g;' < $fn.txt | perl -ne 'print pack("B8", $_)' > $fn.bin
