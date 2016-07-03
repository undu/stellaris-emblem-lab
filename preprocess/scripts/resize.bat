@echo off
:: Adds borders of size * 1.5 / 24 pixels; squares the image, and resizes it.
:: Makes sure the shadows in the badges don't get cut and the badge gets to be
:: as big as possible.
:: Textures need to be square as a requirement from the game.
:: Resizes the image to 512x512 as adding highlights and shadows requires an
:: arbitrary size, this was the chosen one.
:: %1 is the image name
:: %2 is the "directory prefix"

if not exist %2\temp end

for /F %%i in ('magick convert "%2\temp\%~n1_cleaned.png" -format "%%[fx:w+floor(w*0.0625)]x%%[fx:h+floor(h*0.0625)]" info:') do (
echo   resize
magick convert "%2\temp\%~n1_cleaned.png" ^
       -background black -gravity center -extent %%i ^
       -resize x1024 -resize "1024x>" ^
       "%2\temp\%~n1_resized.png"
magick convert "%2\temp\%~n1_resized.png" ^
        -alpha off ^
        -resize 50%% -gravity center -background black -extent 512x512 +repage ^
        "%2\final\%~n1.png"
)
