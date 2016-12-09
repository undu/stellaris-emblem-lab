cwlVersion: 1.0
class: CommandLineTool
baseCommand: [sh, highlight_mask.sh]
inputs:
  outline:
    type: File
  gradient_mask:
    type: File
outputs:
  highlight_mask:
    type: File
    outputBinding:
      glob: highlight_mask.png

