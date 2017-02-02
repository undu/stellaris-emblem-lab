folder='bevels/montage'

if [ ! -d "${folder}" ]; then
  mkdir -p "${folder}"
fi

for img in img/*.png; do 
  echo Processing "${img##*/}"
  sh ./bevels/scripts/bevel_emblems.sh "${img}" bevels
done

sh ./common_scripts\montage.sh bevels bevels/montage 5x
