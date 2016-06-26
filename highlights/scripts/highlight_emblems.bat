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
magick convert %1 -quiet -morphology HMT ^
       "5:0,-,-,-,- -,-,-,-,- -,-,-,-,- -,-,-,-,- 1,-,-,-,-; 3:0,-,1 -,-,- -,-,-" ^
       -alpha copy ^
       %2\temp\gradient_highlight.png -compose atop -composite ^
       "%2\temp\%~n1_highlight_mask.png"

magick convert "%2\temp\%~n1_fill.png" ^
       "%2\temp\%~n1_highlight_mask.png" -compose screen -composite ^
       -sigmoidal-contrast 2,50%% ^
       -background white ^
       "%2\temp\%~n1_highlight.png"

:: default emblems
magick convert "%2\temp\%~n1_highlight.png" -resize 128x128 ^
       "%2\%~nx1"

:: small emblems
magick convert "%2\temp\%~n1_highlight.png" ^
       -fill black -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% ^
       "%2\temp\%~n1_highlight.png" -composite ^
       -resize 24x24 ^
       "%2\small\%~nx1"
