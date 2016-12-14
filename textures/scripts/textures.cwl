cwlVersion: v1.0
doc: Create emblem textures
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement

inputs:
  outlines: File[]
  # files for shell scripts used:
  gradients_gen: File
  gradient_emblem: File
  highlight_mask: File
  highlight_emblem: File
  border_emblem: File
  texture_map: File
  texture_default: File
  texture_small: File
outputs:
  texture_map:
    type: File[]
    outputSource: textures/texture_map
  texture_default:
    type: File[]
    outputSource: textures/texture_map
  texture_small:
    type: File[]
    outputSource: textures/texture_small

steps:
  gradients:
    id: gradients
    run: tools/gradients_gen.cwl
    in:
      command: gradients_gen
    out: [fill_gradient, highlight_gradient]

  textures:
    id: textures
    run: texture_emblem.cwl
    scatter: outline
    in:
      outline: outlines
      fill_gradient: gradients/fill_gradient
      highlight_gradient: gradients/highlight_gradient
      # files for shell scripts used:
      gradient_emblem: gradient_emblem
      highlight_mask: highlight_mask
      highlight_emblem: highlight_emblem
      border_emblem: border_emblem
      texture_map: texture_map
      texture_default: texture_default
      texture_small: texture_small
    out: [texture_default, texture_map, texture_small]

