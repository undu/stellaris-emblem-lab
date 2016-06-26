
@echo off
:: %1 is the input prefix directory
:: %2 is the output prefix directory

::big montage with names
magick montage %1\*.* -set label %%t -tile 5x -geometry 128x128+1+1 ^
       -background black -fill white -font YanoneKaffeesatz-Bold -pointsize 16 ^
       %2\montage.png

::small montage
magick montage %1\small\*.* -tile 5x -geometry 24x24+1+1 ^
       -background white ^
       %2\montage_small.png

::map montage
magick montage %1\map\*.* -tile 5x -geometry 256x256+1+1 ^
       -background black ^
       %2\montage_map.png
