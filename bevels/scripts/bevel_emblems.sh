#!/usr/bin/env sh
# $1 is the image path
# $2 is the "directory prefix"

fileExt="${1##*/}"
file="${fileExt%.*}"
folder="$2"

# create necessary folders
for folder in 'temp' 'small';  do
  if [ ! -d "${2}/${folder}" ]; then
    mkdir -p "${2}/${folder}"
  fi
done

# bevel mask
magick convert ${1} -quiet -alpha copy -alpha extract \
       -blur 0x6 -shade 120x21.78 -contrast-stretch 0%% \
       ${1} +sigmoidal-contrast 10x50%% -fill grey50 -colorize 10%% \
       -compose CopyOpacity -composite \
       "${2}/temp/${file}_bevel_mask.png"

# bevel mask removes some transparency, add it back in
magick convert ${1} -quiet -alpha copy \
       "${2}/temp/${file}_bevel_mask.png" -compose atop -composite \
       "${2}/temp/${file}_bevel.png"

# default emblems
magick convert "${2}/temp/${file}_bevel.png" -resize 128x128 \
       "${2}/${file}.png"

# small emblems
magick convert "${2}/temp/${file}_bevel.png" \
       -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% \
       "${2}/temp/${file}_bevel.png" -composite \
       -resize 24x24 \
       "${2}/small/${file}.png"
