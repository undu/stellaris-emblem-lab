@echo off
:: Prepares images to be ideal for the badge-creating process
if not exist preprocess\temp md preprocess\temp
if not exist preprocess\final md preprocess\final

for %%a in (raw\*.png) do (
  echo processing %%a
  call preprocess\scripts\trim.bat %%a preprocess
  :: Not needed if the images are already a white figure on black background
  call preprocess\scripts\invert.bat %%a preprocess
  call preprocess\scripts\resize.bat %%a preprocess
)

rmdir temp
PAUSE
