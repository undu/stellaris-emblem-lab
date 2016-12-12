cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
inputs:
  command:
    type: File
    inputBinding:
      position: 1
  gradient_emblem:
    type: File
    inputBinding:
      position: 2
  gradient_mask:
    type: File
    inputBinding:
      position: 3
outputs:
  gradient_emblem:
    type: File
    outputBinding:
      glob: highlight_emblem.png

