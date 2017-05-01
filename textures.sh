#!/usr/bin/env sh
folder='textures/workshop'

cwltool "textures/textures.cwl" "textures/jobs/textures-job.yml"

if [ ! -d "${folder}" ]; then
  mkdir -p "${folder}"
fi

sh ./common_scripts/montage.sh out textures/workshop 5x

