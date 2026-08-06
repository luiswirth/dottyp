// Only document-style writes the palette. Everything else reads it under
// context, which is what makes light and dark one code path.

#let light-theme = (
  fg: black,
  bg: white,
  muted: luma(40%),
  accent: blue,
  emphasis: red,
  surface: luma(94%),
  marker: yellow.lighten(55%),
)

#let dark-theme = (
  fg: white,
  bg: black,
  muted: luma(60%),
  accent: blue.lighten(40%),
  emphasis: red.lighten(20%),
  surface: luma(15%),
  marker: yellow.darken(72%),
)

#let palette = state("dottyp-palette", light-theme)
