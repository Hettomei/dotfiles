#!/bin/bash
# A simple shell script to rip audio cd and create mp3 using lame
# and cdparanoia utilities.
# ----------------------------------------------------------------------------
# Written by Vivek Gite
# (c) 2006 nixCraft under GNU GPL v2.0+
# ----------------------------------------------------------------------------
# brew install cdparanoia
cdparanoia -B
for i in *.wav
do
  lame --vbr-new -b 360 "$i" "${i%%.cdda.wav}.mp3"
  rm -f "$i"
done
