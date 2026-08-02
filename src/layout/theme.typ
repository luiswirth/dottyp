// The colors a document is drawn in, carried in state so that a box nested
// anywhere can ask for them instead of naming white or black itself.
//
// Only document-style writes it. Everything else reads it under context.

#let light-theme = (
  fg: black,
  bg: white,
  muted: luma(40%),
  accent: blue,
  emphasis: red,
  surface: luma(94%),
)

#let dark-theme = (
  fg: white,
  bg: black,
  muted: luma(60%),
  accent: blue.lighten(40%),
  emphasis: red.lighten(20%),
  surface: luma(15%),
)

#let palette = state("dottyp-palette", light-theme)
