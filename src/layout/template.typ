#import "theme.typ": *
#import "../math/style.typ": math-style

// The page a document is set on. Light and dark differ only in the palette
// handed in, which is why there is one template and not two.

// The margin is set from the measure rather than the other way round: prose
// reads at 45 to 75 characters a line, and 12pt over 14cm is 72 of them. A
// document that wants density says so, as the cram sheets do.
//
// Justification is off because it spreads its slack over the inter-word gaps,
// and prose carrying inline math offers too few of them, so the slack collects
// in a handful of holes. Hyphenation follows justification and is off with it.
#let document-style(
  colors: light-theme,
  paper: "a4",
  margin: (x: 3.5cm, y: 3cm),
  numbering: "1",
  font: "New Computer Modern Sans",
  size: 12pt,
  justify: false,
  leading: 0.65em,
  doc,
) = {
  palette.update(colors)

  // Numbered here and not only in section-style, since an outline that points
  // at a page the page itself does not name is useless.
  set page(paper: paper, margin: margin, fill: colors.bg, numbering: numbering)
  set text(font: font, size: size, fill: colors.fg)
  set par(justify: justify, leading: leading)

  // An item is spaced like a line, always. Typst would otherwise widen a list
  // whose items are separated by blank lines, which is the Markdown rule for
  // multi-paragraph items and wrong here: prose is broken semantically, so a
  // blank line is a way of laying out the source and carries no meaning.
  set list(spacing: leading)
  set enum(spacing: leading)

  show link: set text(fill: colors.accent)

  show: math-style

  doc
}
