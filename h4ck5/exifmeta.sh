##!/bin/bash

###################################################################################
# metapl3x.sh
# ffmpeg titel and comment metadata change script
###################################################################################
# script read all mp4 files and change title and comment metadata
# like remove "RARBG.COM - titel.mp4"
###################################################################################
#ffmpeg -i inputfile -metadata title="Movie Title" -metadata year="2010" outputfile
#exiftool IMG_0014.MOV >a.txt
#ffmpeg -i input_video -f ffmetadata metadata.txt
#exiftool bumsbuero.16.09.30.ashley.cumstar.de.mp4 | grep Title
###################################################################################
# last modify: 04.07.2017
# bug or anything: d43M0n23@3xpl0it.com
###################################################################################

#Variablen
owntag=core
mp4tag=mp4
mkvtag=mkv

# Tools install
if ! hash exiftool 2>/dev/null; then sudo apt-get update && apt-get upgrade -y; sudo apt-get install --yes exiftool ; fi
if ! hash ffmpeg 2>/dev/null; then sudo apt-get install --yes ffmpeg ; fi

#for file in *.mp4 *.mkv (Testen)
# echo ${VALUE%.*}
for file in *;
do
  find "$file" -type f -not -name ".*" | grep .mp4$ | while read file
  do
	exiftool $file | grep Title
  done
done

