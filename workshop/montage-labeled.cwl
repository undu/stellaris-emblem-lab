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
  label:
    # not recommended to be overriden
    type: string[]
    default: ['label', '%t']
    inputBinding:
      position: 2
      prefix: -set
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
    type: string
    default: YanoneKaffeesatz-Bold
    inputBinding:
      position: 6
      prefix: -font
  fontsize:
    type: string
    default: '16'
    inputBinding:
      position: 7
      prefix: -pointsize
  montagename:
    type: string
    # default: montage.png
    inputBinding:
      position: 8
outputs:
  montage:
    type: File
    outputBinding:
      glob: $(inputs.montagename)

