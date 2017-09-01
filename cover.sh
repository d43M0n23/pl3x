##!/bin/bash

###################################################################################
# cover.sh
###################################################################################
# script search
###################################################################################
###################################################################################
# last modify: 04.07.2017
# bug or anything: d43M0n23@3xpl0it.com
###################################################################################

##Variablen
DATE=$(date +%F)

# Local Destination
DESTINATION=/home/infinity/03-Adult/Movies/

# Logfile
LOG="cover.log"

# Cover
COVER=cover.jpg

# Tools install
#if ! hash exiftool 2>/dev/null; then sudo apt-get update && apt-get upgrade -y; sudo apt-get install --yes exiftool ; fi

# Log & bka-dir check
if [ ! -f $LOG ]; then touch $LOG; fi
#if [ ! -d $DESTINATION ]; then mkdir $DESTINATION; fi


# Tools install
#if ! hash exiftool 2>/dev/null; then sudo apt-get update && apt-get upgrade -y; sudo apt-get install --yes exiftool ; fi
#if ! hash ffmpeg 2>/dev/null; then sudo apt-get install --yes ffmpeg ; fi

#for file in *.mp4 *.mkv (Testen)
# echo ${VALUE%.*}
for file in *;
do
  find "$file" -type f -not -name ".*" | grep .mp4$ | while read file
  do
   pfad=$(readlink -f "$file") # kpl. Pfad
	DirPath=$pfad
#	echo "$DirPath"
	DirPath="$(dirname $DirPath)"
	if [ ! -f ${DirPath}/${COVER} ]; then
        echo "$DirPath"
	echo "$DirPath" >> $LOG
	fi
  done
done

