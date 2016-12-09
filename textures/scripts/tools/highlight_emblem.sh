#!/usr/bin/env sh
# $1 is the emblem with a gradient
# $2 is the highlight mask

magick convert "${1}" \
       "${2}" -compose screen -composite \
       -sigmoidal-contrast 2,50%% \
       -background white \
       "highlight_emblem.png"
