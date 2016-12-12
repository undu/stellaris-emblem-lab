cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
inputs:
  command:
    type: File
    inputBinding:
      position: 1
  outline:
    type: File
    inputBinding:
      position: 2
  fill_gradient:
    type: File
    inputBinding:
      position: 3
outputs:
  gradient_emblem:
    type: File
    outputBinding:
      glob: gradient_emblem.png

