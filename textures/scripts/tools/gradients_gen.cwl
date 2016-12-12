cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
inputs:
  command:
    type: File
    inputBinding:
      position: 1
outputs:
  fill_gradient:
    type: File
    outputBinding:
      glob: fill_gradient.png
  highlight_gradient:
    type: File
    outputBinding:
      glob: highlight_gradient.png

