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
outputs:
  border_emblem:
    type: File
    outputBinding:
      glob: border_emblem.png

