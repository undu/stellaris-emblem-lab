#!/usr/bin/env sh
# $1 is the highlight emblem
# $2 is the border emblem
# $3 is the name of the produced file

# small emblems
convert "${1}" \
        -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% \
        "${1}" -compose Over -composite \
        "${2}" -compose Dst_Over -composite \
        -colorspace RGB -resize 24x24 -colorspace sRGB \
        -define dds:compression=none \
        "${3}.dds"
