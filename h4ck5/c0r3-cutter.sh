#!/bin/bash

######################################################################
# c0r3-cutter.sh
# cut NAME_core.mp4 2 NAME.mp4
######################################################################

######################################################################
# last modify: 04.07.2017
# bug or anything: d43M0n23@3xpl0it.com
######################################################################
# TODO EXAMPLE:
# fab_130628_0554_core.mp4
# can to: cut -f 1 -d '_'
######################################################################
#Variablen
owntag=core
mp4tag=mp4
mkvtag=mkv

#cut -f 1 -d '_'

#for file in *.mp4 *.mkv (Testen)
# echo ${VALUE%.*}
for file in *;
do
  find "$file" -type f -not -name ".*" | grep .mp4$ | while read file
  do
	newfile=${file%_core.*}
#        newfile=${file%.*}
	mv $file ${newfile}.${mp4tag}
#        ffmpeg -i $file -c copy -metadata title="$newtag" -metadata comment="$newtag" -y ${newfile}_${owntag}.${mp4tag}
        echo $file korrigiert.
  done
done

