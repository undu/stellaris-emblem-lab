cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
hints:
  - class: DockerRequirement
    dockerPull: undu/imagemagick
inputs:
  command:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: highlight_emblem.sh
  gradient_emblem:
    type: File
    inputBinding:
      position: 2
  gradient_mask:
    type: File
    inputBinding:
      position: 3
outputs:
  highlight_emblem:
    type: File
    outputBinding:
      glob: highlight_emblem.png

