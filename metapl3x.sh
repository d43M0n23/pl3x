##!/bin/bash

# ffmpeg titel and comment change script
#########################################################################################
# script read all mp4 files and change title and comment metadata 
# like remove "RARBG.COM - titel.mp4"
#########################################################################################
#ffmpeg -i inputfile -metadata title="Movie Title" -metadata year="2010" outputfile
#exiftool IMG_0014.MOV >a.txt
#ffmpeg -i input_video -f ffmetadata metadata.txt
#exiftool bumsbuero.16.09.30.ashley.cumstar.de.mp4 | grep Title
#############################################
#METADATA:
#Title
#Comment
#############################################
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
    pfad=$(readlink -f "$file") # kpl. Pfad
	DirPath=$pfad
	DirPath="$(dirname $DirPath)"
	DirPath="$(basename $DirPath)"
   	echo "$DirPath"
	newtag=${DirPath%.XXX*}
	newfile=${file%.*}
	ffmpeg -i $file -c copy -metadata title="$newtag" -metadata comment="$newtag" -y ${newfile}_${owntag}.${mp4tag}
	echo $file korrigiert.
	rm $file
  done
done

