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

// The defining occurrence of a term, and the sentence a section has to be able
// to state. Both leave metadata, so what a document defines and what it claims
// are queryable without parsing the source.
//
// A term's name is a string and never markup, so the collected vocabulary needs
// no conversion.
#let term(name) = {
  metadata((kind: "term", name: name))
  strong(name)
}

// Typst's highlight is a text decoration and leaves inline math unpainted, so a
// key opens with words and keeps its math outside.
#let key(body) = {
  metadata((kind: "key", body: body))
  context highlight(fill: palette.get().marker, body)
}

#let importanteq(body) = context {
  show math.equation: set text(fill: palette.get().emphasis)
  body
}
