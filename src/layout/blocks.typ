#import "theme.typ": palette

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

#let framed(body) = context block(
  stroke: 0.5pt + palette.get().fg,
  inset: 5pt,
  breakable: false,
  body,
)

#let circletext(body) = context box(
  baseline: 0.2em,
  stroke: palette.get().fg,
  inset: 0.2em,
  radius: 0.3em,
  body,
)

#let finishline = context line(
  stroke: palette.get().emphasis + 0.3pt,
  length: 100%,
)

#let importanteq(body) = context {
  set math.equation(numbering: "(1)")
  show math.equation: set text(fill: palette.get().emphasis)
  body
}
