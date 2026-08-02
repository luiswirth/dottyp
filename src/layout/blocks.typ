#import "theme.typ": palette

// Boxes that call something out of the flow. Every color is read from the
// palette, so the same box works on a white page and a black one.

// A titled panel: the title sits on a colored bar, the body on the surface
// beneath it.
#let titlebox(color: none, width: 100%, title, body) = context {
  let p = palette.get()
  block(
    fill: if color == none { p.emphasis.darken(40%) } else { color },
    stroke: p.fg,
    inset: 0.3em,
    radius: 0.3em,
    breakable: false,
    width: width,
    {
      block(inset: 0.2em, pad(x: 1em, strong(title)))
      block(
        fill: p.surface,
        inset: 1.2em,
        above: 0.3em,
        width: 100%,
        body,
      )
    },
  )
}

// A plain framed block, for a statement that needs setting apart but not
// naming.
#let framed(body) = context block(
  stroke: 0.5pt + palette.get().fg,
  inset: 5pt,
  breakable: false,
  body,
)

// A word or number in a rounded frame, sitting on the baseline of its line.
#let circletext(body) = context box(
  baseline: 0.2em,
  stroke: palette.get().fg,
  inset: 0.2em,
  radius: 0.3em,
  body,
)

// A rule marking where a reading or a revision stopped.
#let finishline = context line(
  stroke: palette.get().emphasis + 0.3pt,
  length: 100%,
)

// An equation worth pointing at, numbered and colored even where the
// surrounding equations are neither.
#let importanteq(body) = context {
  set math.equation(numbering: "(1)")
  show math.equation: set text(fill: palette.get().emphasis)
  body
}
