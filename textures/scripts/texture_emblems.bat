@echo off
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist textures\temp md textures\temp
if not exist textures\dds\small md textures\dds\small
if not exist textures\dds\map md textures\dds\map

::gradient fill
magick convert %1 -quiet -alpha copy ^
       %2\temp\gradient_fill.png -compose atop -composite ^
       "%2\temp\%~n1_fill.png"

::highlights
magick convert %1 -quiet -morphology HMT ^
       "5:0,-,-,-,- -,-,-,-,- -,-,-,-,- -,-,-,-,- 1,-,-,-,-; 3:0,-,1 -,-,- -,-,-" ^
       -alpha copy ^
       %2\temp\gradient_highlight.png -compose atop -composite ^
       "%2\temp\%~n1_highlights.png"

magick convert "%2\temp\%~n1_fill.png" ^
       "%2\temp\%~n1_highlights.png" -compose screen -composite ^
       -sigmoidal-contrast 2,50%% ^
       -background white ^
       "%2\temp\%~n1.png"

:: default emblems
magick convert "%2\temp\%~n1.png" ^
       -colorspace RGB -resize 128x128 -colorspace sRGB ^
       -define dds:compression=dxt5 -define dds:cluster-fit=true -define dds:weight-by-alpha=true ^
       "%2\dds\%~n1.dds"

:: small emblems
magick convert "%2\temp\%~n1.png" ^
       -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% ^
       "%2\temp\%~n1.png" -composite ^
       -colorspace RGB -resize 24x24 -colorspace sRGB ^
       "%2\dds\small\%~n1.dds"

::map emblems
magick convert "%1" -alpha copy ^
       -resize 256x256 ^
       -define dds:compression=dxt5 -define dds:cluster-fit=true -define dds:weight-by-alpha=true ^
       "%2\dds\map\%~n1.dds"

del "%2\temp\%~n1_fill.png"
del "%2\temp\%~n1_highlights.png"
del "%2\temp\%~n1.png"
