@echo off

if not exist highlights\montage md highlights\montage

call highlights\scripts\gradients_gen.bat

for %%a in (img\*.png) do (
  echo Processing %%~nxa
  call highlights\scripts\highlight_emblems.bat %%a highlights
)

call common_scripts\montage.bat highlights highlights\montage 5x

pause
