@echo off
:: inverts colours on the image
:: image should be white figure on black background at the end of the process
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist %2\temp end

echo   invert colours
magick convert "%2\temp\%~n1_cleaned.png" -negate ^
       "%2\temp\%~n1_cleaned.png"
