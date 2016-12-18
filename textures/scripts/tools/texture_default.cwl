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
      location: texture_default.sh
  highlight:
    type: File
    inputBinding:
      position: 2
  file_name:
    type: string
    inputBinding:
      position: 3
outputs:
  texture:
    type: File
    outputBinding:
      glob: $(inputs.file_name).dds

