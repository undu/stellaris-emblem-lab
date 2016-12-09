cwlVersion: 1.0
class: Workflow

inputs:
  outline: File
  fill_gradient: File
  highlight_gradient: File
outputs:
  texture_small:
    type: File
    outputSource: small/texture
    outputBinding:
      outputEval: texture/$(inputs.outline.nameroot).dds

steps:
  gradient:
    run: tools/gradient_emblem.cwl
    in:
      outline: outline
      fill_gradient: fill_gradient
    out: [gradient_emblem]

  highlight_mask:
    run: tools/highlight_mask.cwl
    in:
      outline: outline
      gradient_mask: highlight_gradient
    out: [highlight_mask]

  highlight:
    run: tools/highlight_emblem.cwl
    in:
      gradient_emblem: gradient/gradient_emblem
      gradient_mask: highlight_mask/highlight_mask
    out: [gradient_emblem]

  border:
    run: tools/border_emblem.cwl
    in:
      outline: outline
    out: [border_emblem]

  small:
    run: tools/texture_small.cwl
    in:
      highlight: highlight/gradient_emblem
      border: border/border_emblem
    out: [texture]

