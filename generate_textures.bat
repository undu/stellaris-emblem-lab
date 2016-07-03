@echo off

if not exist textures\workshop md textures\workshop

call textures\scripts\gradients_gen.bat

for %%a in (img\*.png) do (
  echo Processing %%~nxa
  call textures\scripts\texture_emblems.bat %%a textures
)

call common_scripts\montage.bat textures\dds textures\workshop 5x

del textures\temp\gradient_fill.png
del textures\temp\gradient_highlight.png

rmdir textures\temp
