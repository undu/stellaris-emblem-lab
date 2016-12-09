#!/usr/bin/env sh
# $1 is the image path
# $2 is the highlight gradient

#highlights
magick convert $1 -quiet -morphology HMT \
       "6x6+0+5:0,-,-,-,-,- -,-,-,-,-,- -,-,-,-,-,- -,-,-,-,-,- -,-,-,-,-,- 1,-,-,-,-,-; 3x3+2+0:0,-,1 -,-,- -,-,-" \
       -alpha copy \
       "${2}" -compose atop -composite \
       "highlight_mask.png"

