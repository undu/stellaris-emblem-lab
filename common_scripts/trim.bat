@echo off

if not exist temp md temp

:: trim image
echo   trim
magick convert %1 -alpha set -trim +repage ^
       "temp\%~n1_trimmed.png"
