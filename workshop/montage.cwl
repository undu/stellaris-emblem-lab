cwlVersion: v1.0
class: CommandLineTool
baseCommand: montage
inputs:
  images:
    type: File[]
    inputBinding:
      position: 1
  gridsize:
    # rowsxcols
    type: string
    inputBinding:
      position: 2
      prefix: -tile
  imagegeometry:
    # 128x128+1+1
    type: string
    inputBinding:
      position: 3
      prefix: -geometry
  backgroundcolour:
    type: string
    default: black
    inputBinding:
      position: 3
      prefix: -background
  montagename:
    type: string
    default: montage.png
    inputBinding:
      position: 5
outputs:
  montage:
    type: File
    outputBinding:
      glob: $(inputs.montagename)

