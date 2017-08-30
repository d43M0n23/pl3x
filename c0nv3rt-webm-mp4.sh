#!/bin/bash

######################################################################
# c0nv3rt-webm-mp4.sh
# cut NAME_core.mp4 2 NAME.mp4
######################################################################

######################################################################
# TODO EXAMPLE:
# fab_130628_0554_core.mp4
# can to: cut -f 1 -d '_'
######################################################################
# Global Command:
# ffmpeg [global options] [input file options] -i input-file-name [output options] output-file-name
# Variablen
# mp4 2 webm
# ffmpeg -i input-file.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output-file.webm
# webm 2 mp4
# ffmpeg -fflags +genpts -i $0 -r 24 $1
# last modify: 31.08.2017
# bug or anything: d43M0n23@3xpl0it.com
######################################################################

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
  find "$file" -type f -not -name ".*" | grep .webm$ | while read file
  do
    pfad=$(readlink -f "$file") # kpl. Pfad
        DirPath=$pfad
        DirPath="$(dirname $DirPath)"
        DirPath="$(basename $DirPath)"
        echo "$DirPath"
 #       newtag=${DirPath%.XXX*}
        newfile=${file%.*}
	avconv -i $file -c:v libx264  -crf 20 -c:a acc -strict experimental ${newfile}.${mp4tag}
        echo $file korrigiert.
#       cp $file ${file}.bka # Absicherung
#        rm $file
  done
done

