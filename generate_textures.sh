#!/usr/bin/env sh

folder='textures/workshop'
if [ ! -d "${folder}" ]; then
  mkdir -p "${folder}"
fi


sh ./textures/scripts/gradients_gen.sh
for img in img/*.png; do
  echo Processing "${img##*/}"
  sh ./textures/scripts/texture_emblems.sh "${img}" textures
done

sh ./common_scripts/montage.sh textures/dds textures/workshop 5x

rm textures/temp/gradient_fill.png
rm textures/temp/gradient_highlight.png

rm -rf textures/temp
