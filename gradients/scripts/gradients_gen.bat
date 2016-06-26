@echo off
if not exist gradients\temp md gradients\temp

:: fill gradients
magick convert canvas:"#D6CAB6" canvas:"#c1a978" canvas:"#725506" ^
       -append -filter Cubic -resize 512x512! ^
       gradients\temp\gradient_resize_cubic_fill.png

magick convert canvas:"#D6CAB6" canvas:"#c1a978" canvas:"#725506" ^
       -append -filter Catrom -resize 512x512! ^
       gradients\temp\gradient_resize_spline_fill.png

magick convert -size 512x512 gradient: -interpolate Catrom ^
       ( +size canvas:"#725506" canvas:"#c1a978" canvas:"#D6CAB6" +append ) -clut ^
       gradients\temp\gradient_clut_catrom_fill.png

:: highlight gradients
magick convert canvas:"#FFFFFF" canvas:"#E5D9C5" canvas:"#CCBCA3" ^
       -append -filter Cubic -resize 512x512! ^
       gradients\temp\gradient_resize_cubic_highlight.png

magick convert canvas:"#FFFFFF" canvas:"#E5D9C5" canvas:"#CCBCA3" ^
       -append -filter Catrom -resize 512x512! ^
       gradients\temp\gradient_resize_spline_highlight.png

magick convert -size 512x512 gradient: -interpolate Catrom ^
       ( +size canvas:"#CCBCA3" canvas:"#E5D9C5" canvas:"#FFFFFF" +append ) -clut ^
       gradients\temp\gradient_clut_catrom_highlight.png
