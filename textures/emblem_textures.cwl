cwlVersion: v1.0
class: Workflow

requirements:
  - class: StepInputExpressionRequirement

inputs:
  outline: File
  fill_gradient: File
  highlight_gradient: File

outputs:
  texture_small:
    type: File
    outputSource: small/texture
  texture_default:
    type: File
    outputSource: default/texture
  texture_map:
    type: File
    outputSource: map/texture

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
    out: [highlight_emblem]

  border:
    run: tools/border_emblem.cwl
    in:
      outline: outline
    out: [border_emblem]

  map:
    run: tools/texture_map.cwl
    in:
      # needed to transform to generate file_name
      outline: outline
      file_name:
        valueFrom: $(inputs.outline.nameroot)
    out: [texture]

  default:
    run: tools/texture_default.cwl
    in:
      # needed to transform to generate file_name
      highlight: highlight/highlight_emblem
      file_name:
        source: outline
        valueFrom: $(self.nameroot)

    out: [texture]

  small:
    run: tools/texture_small.cwl
    in:
      # needed to transform to generate file_name
      highlight: highlight/highlight_emblem
      border: border/border_emblem
      file_name:
        source: outline
        valueFrom: $(self.nameroot)
    out: [texture]

