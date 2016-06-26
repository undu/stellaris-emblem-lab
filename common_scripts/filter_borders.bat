@echo off

if not exist temp md temp

:: clean + trim image
echo   filter and trim
magick convert "%1" ^
       filter.png -compose over -composite -alpha set -trim +repage ^
       "temp\%~n1_cleaned.png"
