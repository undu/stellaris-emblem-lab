@echo off
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist %2\temp md %2\temp
if not exist %2\small md %2\small

::bevel mask
magick convert %1 -quiet -alpha copy -alpha extract ^
       -blur 0x6 -shade 120x21.78 -contrast-stretch 0%% ^
       %1 +sigmoidal-contrast 10x50%% -fill grey50 -colorize 10%% ^
       -compose CopyOpacity -composite ^
       "%2\temp\%~n1_bevel_mask.png"

::bevel mask removes some transparency, add it back in
magick convert %1 -quiet -alpha copy ^
       "%2\temp\%~n1_bevel_mask.png" -compose atop -composite ^
       "%2\temp\%~n1_bevel.png"

:: default emblems
magick convert "%2\temp\%~n1_bevel.png" -resize 128x128 ^
       "%2\%~n1.png"

:: small emblems
magick convert "%2\temp\%~n1_bevel.png" ^
       -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% ^
       "%2\temp\%~n1_bevel.png" -composite ^
       -resize 24x24 ^
       "%2\small\%~n1.png"
