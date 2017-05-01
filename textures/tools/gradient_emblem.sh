#!/usr/bin/env sh
# $1 is the image path
# $2 is the gradient

#gradient fill
convert "${1}" -quiet -alpha copy \
        "${2}" -compose atop -composite \
        "gradient_emblem.png"
