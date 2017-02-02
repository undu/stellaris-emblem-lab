cwlVersion: v1.0
doc: Create emblem textures
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement
  - class: InlineJavascriptRequirement

inputs:
  outlines: Directory

outputs:
  texture_map:
    type: Directory[]
    outputSource: organize/folders

steps:
  gradients:
    run: tools/gradients_gen.cwl
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
        $({ "outlines": inputs.folder.listing })

  textures:
    run: texture_emblem.cwl
    scatter: outline
    in:
      outline: extractListing/outlines
      fill_gradient: gradients/fill_gradient
      highlight_gradient: gradients/highlight_gradient
    out: [texture_default, texture_map, texture_small]

  # Move textures in their respective folders
  organize:
    in:
      default: textures/texture_default
      map: textures/texture_map
      small: textures/texture_small
    out: [folders]
    run:
      class: ExpressionTool
      id: "organize"
      inputs:
        map: File[]
      outputs:
        folders: Directory[]
      expression: |
        ${
          var folders = [];
          folders.push({
            "class": "Directory",
            "basename": "out",
            "listing": inputs.default
          });
          folders.push({
            "class": "Directory",
            "basename": "out/map",
            "listing": inputs.map
          });
          folders.push({
            "class": "Directory",
            "basename": "out/small",
            "listing": inputs.small
          });
          return { "folders": folders };
        }
