cwlVersion: v1.0
doc: Create emblem textures
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement
  - class: InlineJavascriptRequirement
  - class: StepInputExpressionRequirement

inputs:
  outlines: File[]
  outlines_new: Directory

outputs:
  texture_map:
    type: Directory[]
    outputSource: organize/folders

steps:
  gradients:
    run: tools/gradients_gen.cwl
    in: []
    out: [fill_gradient, highlight_gradient]

  textures:
    run: texture_emblem.cwl
    scatter: outlines
    in:
      outlines_dir: outlines_new
      outlines:
        valueFrom: $(inputs.outlines_dir.listing)
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
