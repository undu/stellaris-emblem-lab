@echo off
:: trim image
:: probably doesn't work with grainy images.
:: propose a fix or clean the images first :)
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist %2\temp md %2\temp

echo   trim
magick convert %1 -alpha set -trim +repage ^
        "%2\temp\%~n1_cleaned.png"
