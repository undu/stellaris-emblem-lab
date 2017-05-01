#!/usr/bin/env sh
folder='textures/workshop'

cwltool --quiet --non-strict "textures/textures.cwl" "textures/jobs/textures-job.yml"

if [ ! -d "${folder}" ]; then
  mkdir -p "${folder}"
fi

sh ./workshop/montage.sh out textures/workshop 5x

