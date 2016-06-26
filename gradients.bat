@echo off

if not exist gradients\montage md gradients\montage

call gradients\scripts\gradients_gen.bat

for %%a in (img\*.png) do (
  echo Processing %%~nxa
  call gradients\scripts\fill_emblems.bat %%a gradients
)

call common_scripts\montage.bat gradients gradients\montage 5x

pause
