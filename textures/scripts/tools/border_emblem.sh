#!/usr/bin/env sh
# $1 is the image path

magick convert \( $1 -morphology EdgeOut Octagon:3 -alpha copy \) \
       \( -size 512x512 canvas:black \) -compose atop -composite \
       "border_emblem.png"
