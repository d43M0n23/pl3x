#!/bin/bash

# ffmpeg titel change
#########################################################################################
# script read all files and change title
# remove "RARBG.COM - titel.mp4"
#########################################################################################

#ffmpeg -i input.mp4 -c copy -metadata title="toller film" output.mp4
#ffmpeg -i inputfile -metadata title="Movie Title" -metadata year="2010" outputfile
#find /home/volker/Videos/ -name "*.mp4" -exec stat --printf="%n\n" {} \; > /tmp/mp4-liste.txt
#exiftool IMG_0014.MOV >a.txt
#ffmpeg -i input_video -f ffmetadata metadata.txt
#exiftool bumsbuero.16.09.30.ashley.cumstar.de.mp4 | grep Title
#############################################
#ffmpeg -i input_video -f ffmetadata metadata.txt
#exiftool bumsbuero.16.09.30.ashley.cumstar.de.mp4 | grep Title
#DATA:
#bumsbuero.16.09.30.ashley.cumstar.de.mp4
#Title                           : RARBG.COM - BumsBuero.16.09.30.Ashley.Cumstar.GERMAN.XXX.1080p.MP4-KTR
#Comment                         : RARBG.COM - BumsBuero.16.09.30.Ashley.Cumstar.GERMAN.XXX.1080p.MP4-KTR
#############################################

for file in *;
do
  find "$file" -type f -not -name ".*" | grep .mp4$ | while read file
  do
    pfad=$(readlink -f "$file") # kpl. Pfad
    pfadOhneExt=${pfad%.*} # kpl. Pfad ohne Extension
    mkvTag=$(basename "$pfadOhneExt") # Dateiname ohne MKV = Tag
    echo "$mkvTag"
#    mkvpropedit "$pfad" -s title="$mkvTag"
  done
done

