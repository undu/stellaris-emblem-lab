#!/usr/bin/env sh
# $1 is the image path
# $2 is the "directory prefix"

fileExt="${1##*/}"
file="${fileExt%.*}"
folder="$2"

# create necessary folders
for folder in 'temp' 'dds/small' 'dds/map';  do
  if [ ! -d "${2}/${folder}" ]; then
    mkdir -p "${2}/${folder}"
  fi
done

# gradient fill
magick convert $1 -quiet -alpha copy \
       "${2}/temp/gradient_fill.png" -compose atop -composite \
       "${2}/temp/${file}_fill.png"

# highlights
magick convert $1 -quiet -morphology HMT \
       '6x6+0+5:0,-,-,-,-,- -,-,-,-,-,- -,-,-,-,-,- -,-,-,-,-,- -,-,-,-,-,- 1,-,-,-,-,-; 3x3+2+0:0,-,1 -,-,- -,-,-' \
       -alpha copy \
       "${2}/temp/gradient_highlight.png" -compose atop -composite \
       "${2}/temp/${file}_highlights.png"

magick convert "${2}/temp/${file}_fill.png" \
       "${2}/temp/${file}_highlights.png" -compose screen -composite \
       -sigmoidal-contrast 2,50%% \
       -background white \
       "${2}/temp/${file}.png"

# borders
magick convert \( $1 -morphology EdgeOut Octagon:3 -alpha copy \) \
       \( -size 512x512 canvas:black \) -compose atop -composite \
       "${2}/temp/${file}_border.png"

# default emblems
magick convert "${2}/temp/${file}.png" \
       -colorspace RGB -resize 128x128 -colorspace sRGB \
       -define dds:compression=dxt5 -define dds:cluster-fit=true -define dds:weight-by-alpha=true \
       "${2}/dds/${file}.dds"

# small emblems
magick convert "${2}/temp/${file}.png" \
       -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% \
       "${2}/temp/${file}.png" -compose Over -composite \
       "${2}/temp/${file}_border.png" -compose Dst_Over -composite \
       -colorspace RGB -resize 24x24 -colorspace sRGB \
       -define dds:compression=none \
       "${2}/dds/small/${file}.dds"

# map emblems
magick convert "$1" -alpha copy \
       -resize 256x256 \
       -define dds:compression=dxt5 -define dds:cluster-fit=true -define dds:weight-by-alpha=true \
       "${2}/dds/map/${file}.dds"

rm "${2}/temp/${file}_fill.png"
rm "${2}/temp/${file}_highlights.png"
rm "${2}/temp/${file}_border.png"
rm "${2}/temp/${file}.png"
