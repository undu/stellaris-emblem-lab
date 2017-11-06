cwlVersion: v1.0
class: CommandLineTool
baseCommand: montage
hints:
  - class: DockerRequirement
    dockerPull: undu/imagemagick
inputs:
  gridsize:
    # rowsxcols
    type: string
    inputBinding:
      position: 1
      prefix: -tile
  label:
    # %t for filename
    type: string?
    inputBinding:
      position: 2
      prefix: -label
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
      position: 4
      prefix: -background
  textcolour:
    type: string
    default: white
    inputBinding:
      position: 5
      prefix: -fill
  font:
    type: File
    inputBinding:
      position: 6
      prefix: -font
  fontsize:
    type: string
    inputBinding:
      position: 7
      prefix: -pointsize
  images:
    type: File[]
    inputBinding:
      position: 8
  montagename:
    type: string
    # default: montage.png
    inputBinding:
      position: 9
outputs:
  montage:
    type: File
    outputBinding:
      glob: $(inputs.montagename)

