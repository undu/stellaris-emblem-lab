cwlVersion: v1.0
doc: Create emblem textures
class: Workflow
requirements:
  - class: ScatterFeatureRequirement
  - class: SubworkflowFeatureRequirement

inputs:
  outlines: File[]
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
    run: tools/gradients_gen.cwl
    in: []
    out: [fill_gradient, highlight_gradient]

  textures:
    run: texture_emblem.cwl
    scatter: outline
    in:
      outline: outlines
      fill_gradient: gradients/fill_gradient
      highlight_gradient: gradients/highlight_gradient
    out: [texture_default, texture_map, texture_small]

