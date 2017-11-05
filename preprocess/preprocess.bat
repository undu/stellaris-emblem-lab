@echo off
:: Prepares images to be ideal for the badge-creating process
if not exist temp md temp
if not exist final md final

for %%a in (raw\*.png) do (
  echo processing %%a
  call scripts\trim.bat %%a preprocess
  :: Not needed if the images are already a white figure on black background
  call scripts\invert.bat %%a preprocess
  call scripts\resize.bat %%a preprocess
)

rmdir temp
PAUSE
