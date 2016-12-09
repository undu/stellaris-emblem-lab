cwlVersion: 1.0
class: CommandLineTool
baseCommand: [sh, highlight_emblem.sh]
inputs:
  gradient_emblem:
    type: File
    inputBinding:
      position: 1
  gradient_mask:
    type: File
    inputBinding:
      position: 2
outputs:
  gradient_emblem:
    type: File
    outputBinding:
      glob: highlight_emblem.png

