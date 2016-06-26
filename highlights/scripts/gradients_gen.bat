@echo off
if not exist highlights\temp md highlights\temp

:: Gradient to fill the shapes
magick convert canvas:"#D6CAB6" canvas:"#c1a978" canvas:"#725506" ^
       -append -filter Cubic -resize 512x512! ^
       highlights\temp\gradient_fill.png

:: Gradient to fill the highlights
magick convert canvas:"#FFFFFF" canvas:"#E5D9C5" canvas:"#CCBCA3" ^
       -append -filter Catrom -resize 512x512! ^
       highlights\temp\gradient_highlight.png
