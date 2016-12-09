cwlVersion: 1.0
class: CommandLineTool
baseCommand: [sh, gradient_emblem.sh]
inputs:
  outline:
    type: File
    inputBinding:
      position: 1
  fill_gradient:
    type: File
    inputBinding:
      position: 2
outputs:
  gradient_emblem:
    type: File
    outputBinding:
      glob: gradient_emblem.png

