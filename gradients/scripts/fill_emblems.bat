@echo off
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist %2\temp md %2\temp
if not exist %2\small md %2\small

::gradient fill
magick convert %1 -alpha copy ^
       gradients\temp\gradient_resize_cubic_fill.png -compose atop -composite ^
       -sigmoidal-contrast 2,50%% -modulate 100,125 ^
       "%2\temp\%~n1_gradient.png"

:: default emblems
magick convert "%2\temp\%~n1_gradient.png" -resize 128x128 ^
       "%2\%~nx1"

:: small emblems
magick convert "%2\temp\%~n1_gradient.png" -fill black ^
       -colorize 100%% -channel RGBA -blur 32x32 -level 0,97%% ^
       "%2\temp\%~n1_gradient.png" -composite ^
       -resize 24x24 ^
       "%2\small\%~nx1"
