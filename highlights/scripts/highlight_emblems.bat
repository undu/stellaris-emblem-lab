@echo off
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist %2\temp md %2\temp
if not exist %2\small md %2\small

::gradient fill
magick convert %1 -quiet -alpha copy ^
       %2\temp\gradient_fill.png -compose atop -composite ^
       "%2\temp\%~n1_fill.png"

::highlights
magick convert %1 -morphology HMT ^
       "5:0,-,-,-,- -,-,-,-,- -,-,-,-,- -,-,-,-,- 1,-,-,-,-; 3:0,-,1 -,-,- -,-,-" ^
       -alpha copy ^
       %2\temp\gradient_highlight.png -compose atop -composite ^
       "%2\temp\%~n1_highlight_mask.png"

magick convert "%2\temp\%~n1_fill.png" ^
       "%2\temp\%~n1_highlight_mask.png" -compose screen -composite ^
       -sigmoidal-contrast 2,50%% ^
       -background white ^
       "%2\temp\%~n1_highlight.png"

:: borders
magick convert ( %1 -morphology EdgeOut Octagon:3 -alpha copy )^
       ( -size 512x512 canvas:black ) -compose atop -composite ^
       "%2\temp\%~n1_border.png"

:: default emblems
magick convert "%2\temp\%~n1_highlight.png" ^
       -colorspace RGB -resize 128x128 -colorspace sRGB ^
       "%2\%~nx1"

:: small emblems
magick convert "%2\temp\%~n1_highlight.png" ^
       -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% ^
       "%2\temp\%~n1_highlight.png" -compose Over -composite ^
       "%2\temp\%~n1_border.png" -compose Dst_Over -composite ^
       -colorspace RGB -resize 24x24 -colorspace sRGB ^
       "%2\small\%~nx1"
