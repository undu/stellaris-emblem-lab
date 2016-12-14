#!/usr/bin/env sh
# $1 is the highlight emblem
# $2 is the name of the produced file

# default emblems
magick convert "${1}" \
       -colorspace RGB -resize 128x128 -colorspace sRGB \
       -define dds:compression=dxt5 -define dds:cluster-fit=true -define dds:weight-by-alpha=true \
       "${2}.dds"

