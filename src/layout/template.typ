#import "theme.typ": *
#import "../math/style.typ": math-style

// The page a document is set on. Light and dark differ only in the palette
// handed in, which is why there is one template and not two.

#let document-style(
  colors: light-theme,
  paper: "a4",
  margin: 2cm,
  font: "New Computer Modern Sans",
  size: 10pt,
  justify: true,
  spacing: 0.65em,
  doc,
) = {
  palette.update(colors)

  set page(paper: paper, margin: margin, fill: colors.bg)
  set text(font: font, size: size, fill: colors.fg)
  set par(justify: justify, leading: spacing)
  set list(spacing: spacing)
  set enum(spacing: spacing)

  show link: set text(fill: colors.accent)

  show: math-style

  doc
}
