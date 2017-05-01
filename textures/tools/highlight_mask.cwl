cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
inputs:
  command:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: highlight_mask.sh
  outline:
    type: File
    inputBinding:
      position: 2
  gradient_mask:
    type: File
    inputBinding:
      position: 3
outputs:
  highlight_mask:
    type: File
    outputBinding:
      glob: highlight_mask.png

