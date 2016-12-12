cwlVersion: v1.0
class: Workflow

requirements:
  - class: StepInputExpressionRequirement

inputs:
  outline: File
  fill_gradient: File
  highlight_gradient: File
  # files for shell scripts used:
  gradient_emblem: File
  highlight_mask: File
  highlight_emblem: File
  border_emblem: File
  texture_small: File

outputs:
  texture_small:
    type: File
    outputSource: small/texture

steps:
  gradient:
    run: tools/gradient_emblem.cwl
    in:
      command: gradient_emblem
      outline: outline
      fill_gradient: fill_gradient
    out: [gradient_emblem]

  highlight_mask:
    run: tools/highlight_mask.cwl
    in:
      command: highlight_mask
      outline: outline
      gradient_mask: highlight_gradient
    out: [highlight_mask]

  highlight:
    run: tools/highlight_emblem.cwl
    in:
      command: highlight_emblem
      gradient_emblem: gradient/gradient_emblem
      gradient_mask: highlight_mask/highlight_mask
    out: [gradient_emblem]

  border:
    run: tools/border_emblem.cwl
    in:
      command: border_emblem
      outline: outline
    out: [border_emblem]

  small:
    run: tools/texture_small.cwl
    in:
      command: texture_small
      # needed to transform to generate file_name
      outline: outline
      highlight: highlight/gradient_emblem
      border: border/border_emblem
      file_name:
        valueFrom: $(inputs.outline.nameroot)
    out: [texture]

