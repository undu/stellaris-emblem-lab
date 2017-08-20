cwlVersion: v1.0
doc: create textures and pack them to be a stellaris mod
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement
  - class: InlineJavascriptRequirement

inputs:
  outlines: Directory
  mod_name: string
  gridsize: string

outputs:
  texture_map:
    type: Directory[]
    outputSource: organize/folders

steps:
  gradients:
    run: textures/tools/gradients_gen.cwl
    in: []
    out: [fill_gradient, highlight_gradient]

  extractListing:
    in:
      folder: outlines
    out: [outlines]
    run:
      class: ExpressionTool
      inputs:
        folder: Directory
      outputs:
        outlines: File[]
      expression: |
        $({ 'outlines': inputs.folder.listing })

  textures:
    run: textures/emblem_textures.cwl
    scatter: outline
    in:
      outline: extractListing/outlines
      fill_gradient: gradients/fill_gradient
      highlight_gradient: gradients/highlight_gradient
    out: [texture_default, texture_map, texture_small]

  # generate preview for all the emblems
  montage_default:
    run: workshop/montage-labeled.cwl
    in:
      montagename:
        default: 'montage_default.png'
      images: textures/texture_default
      gridsize: gridsize
      imagegeometry:
        default: '128x128+1+1'
    out: [montage]
  montage_map:
    run: workshop/montage.cwl
    in:
      montagename:
        default: 'montage_map.png'
      images: textures/texture_map
      gridsize: gridsize
      imagegeometry:
        default: '256x256+1+1'
    out: [montage]
  montage_small:
    run: workshop/montage.cwl
    in:
      montagename:
        default: 'montage_small.png'
      images: textures/texture_small
      gridsize: gridsize
      imagegeometry:
        default: '24x24+1+1'
    out: [montage]

  # Pack textures and everything else into the right folders
  organize:
    in:
      mod_name: mod_name
      default: textures/texture_default
      map: textures/texture_map
      small: textures/texture_small
      montage_default: montage_default/montage
      montage_map: montage_map/montage
      montage_small: montage_small/montage
    out: [folders]
    run:
      class: ExpressionTool
      id: 'organize'
      inputs:
        map: File[]
      outputs:
        folders: Directory[]
      expression: |
        ${
          var folders = [];
          folders.push({
            'class': 'Directory',
            'basename': 'out/' + inputs.mod_name + '/flags/' + inputs.mod_name,
            'listing': inputs.default
          });
          folders.push({
            'class': 'Directory',
            'basename': 'out/' + inputs.mod_name + '/flags/' + inputs.mod_name + '/map',
            'listing': inputs.map
          });
          folders.push({
            'class': 'Directory',
            'basename': 'out/' + inputs.mod_name + '/flags/' + inputs.mod_name + '/small',
            'listing': inputs.small
          });
          folders.push({
            'class': 'Directory',
            'basename': 'out/workshop',
            'listing': [inputs.montage_default, inputs.montage_map, inputs.montage_small]
          });
          return { 'folders': folders };
        }
