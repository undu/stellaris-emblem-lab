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
  file_name:
    type: string
    inputBinding:
      position: 3
outputs:
  texture:
    type: File
    outputBinding:
      glob: $(inputs.file_name).dds

