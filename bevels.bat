@echo off

if not exist bevels\montage md bevels\montage

for %%a in (img\*.png) do (
  echo Processing %%~nxa
  call bevels\scripts\bevel_emblems.bat %%a bevels
)

call common_scripts\montage.bat bevels bevels\montage

pause
