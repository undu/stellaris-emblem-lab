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
      location: gradients_gen.sh
outputs:
  fill_gradient:
    type: File
    outputBinding:
      glob: fill_gradient.png
  highlight_gradient:
    type: File
    outputBinding:
      glob: highlight_gradient.png

