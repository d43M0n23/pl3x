#!/bin/bash

######################################################################
# c0nv3rt-webm-mp4.sh
# cut NAME_core.mp4 2 NAME.mp4
######################################################################

######################################################################
# last modify: 31.08.2017
# bug or anything: d43M0n23@3xpl0it.com
######################################################################
# TODO EXAMPLE:
# fab_130628_0554_core.mp4
# can to: cut -f 1 -d '_'
######################################################################
# Global Command:
# ffmpeg [global options] [input file options] -i input-file-name [output options] output-file-name
# Variablen



#mp4 2 webm
#ffmpeg -i input-file.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output-file.webm


#webm 2 mp4
#ffmpeg -fflags +genpts -i $0 -r 24 $1


avconv -i $0 -c:v libx264  -crf 20 -c:a acc -strict experimental $1
