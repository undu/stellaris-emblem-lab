cwlVersion: v1.0
doc: Create emblem textures
class: Workflow

inputs:
  outlines: File[]
outputs:
  texture_small:
    type: File
    outputSource: textures/small
    outputBinding:
      outputEval: texture/$(inputs.outline.nameroot).dds

steps:
  gradients:
    id: gradients
    run: tools/gradients_gen.cwl
    out: [fill_gradient, highlight_gradient]

  textures:
    id: textures
    run: texture_emblem.cwl
    requirements: ScatterfeatureRequirement
    scatter: outline
    in:
      outline: outlines
      fill_gradient: gradients/fill_gradient
      highlight_gradient: gradients/highlight_gradient
    out: [small]

