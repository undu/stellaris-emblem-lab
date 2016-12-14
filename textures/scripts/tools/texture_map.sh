#!/usr/bin/env sh
# $1 is the ouline
# $2 is the name of the produced file

#map emblems
magick convert "${1}" -alpha copy \
       -resize 256x256 \
       -define dds:compression=dxt5 -define dds:cluster-fit=true -define dds:weight-by-alpha=true \
       "${2}.dds"

