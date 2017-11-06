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
      location: gradient_emblem.sh
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

