@echo off

if not exist temp md temp
if not exist final md final

:: add borders of size * 1.5 / 24 pixels; square image, and resize
for /F %%i in ('magick convert temp\%~n1_cleaned.png -format "%%[fx:w+floor(w*0.0625)]x%%[fx:h+floor(h*0.0625)]" info:') do (
echo   resize and invert colours
magick convert temp\%~n1_trimmed.png -background white -gravity center -extent %%i ^
       -resize x1024 -resize "1024x>" ^
       temp\%~n1_resized.png
magicl convert temp\%~n1_resized.png ^
       -alpha off -negate ^
       -resize 50%% -gravity center -background black -extent 512x512 +repage ^
       "final\%~n1.png"
)
