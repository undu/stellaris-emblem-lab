cwlVersion: 1.0
class: CommandLineTool
baseCommand: [sh, gradients_gen.sh]
outputs:
  fill_gradient:
    type: File
    outputBinding:
      glob: fill_gradient.png
  highlight_gradient:
    type: File
    outputBinding:
      glob: highlight_gradient.png

