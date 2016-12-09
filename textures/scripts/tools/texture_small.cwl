cwlVersion: 1.0
class: CommandLineTool
baseCommand: [sh, texture_small.sh]
inputs:
  highlight:
    type: File
    inputBinding:
      position: 1
  border:
    type: File
    inputBinding:
      position: 2
outputs:
  texture:
    type: File
    outputBinding:
      glob: small.dds

