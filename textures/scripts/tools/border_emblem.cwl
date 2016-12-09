cwlVersion: 1.0
class: CommandLineTool
baseCommand: [sh, border_emblem.sh]
inputs:
  outline:
    type: File
    inputBinding:
      position: 1
outputs:
  order_emblem:
    type: File
    outputBinding:
      glob: border_emblem.png

