setlocal EnableDelayedExpansion
:: png files generated with krita crash imagemagick when applying to them morphological operations
:: resaving them without alpha channel and grayscaling them does the trick
if not exist cleaned md cleaned

for %%a in (%*) do (
echo Processing %%~nxa
convert %%a -alpha off -colorspace gray "cleaned\%%~nxa"
)
