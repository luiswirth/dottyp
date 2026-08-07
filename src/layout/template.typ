#import "theme.typ": *
#import "typeface.typ": *
#import "../math/style.typ": math-style

// The margin is set from the measure rather than the other way round: prose
// reads at 45 to 75 characters a line, and 12pt over 14cm is 72 of them.
//
// Justification spreads its slack over the inter-word gaps, and prose carrying
// inline math offers too few of them, so the slack collects in a handful of
// holes.
#let document-style(
  colors: light-theme,
  paper: "a4",
  margin: (x: 3.5cm, y: 3cm),
  numbering: "1",
  fonts: serif-fonts,
  size: 12pt,
  justify: false,
  leading: 0.65em,
  doc,
) = {
  palette.update(colors)

  // Numbered here and not only in section-style: an outline pointing at a page
  // the page itself does not name is useless.
  set page(paper: paper, margin: margin, fill: colors.bg, numbering: numbering)
  set text(font: fonts.text, size: size, fill: colors.fg)
  set par(justify: justify, leading: leading)

  // Typst would otherwise widen a list whose items are separated by blank
  // lines, the Markdown rule for multi-paragraph items. Prose is broken
  // semantically here, so a blank line lays out the source and means nothing.
  set list(spacing: leading)
  set enum(spacing: leading)

  // Everything geometric resolves auto, or a stroke given as a bare width, to
  // literal black rather than to the text color, so each one is handed the
  // palette here.
  set line(stroke: colors.fg)
  set rect(stroke: colors.fg)
  set square(stroke: colors.fg)
  set circle(stroke: colors.fg)
  set ellipse(stroke: colors.fg)
  set polygon(stroke: colors.fg)
  set curve(stroke: colors.fg)
  set table(stroke: colors.fg, inset: (x: 0.8em, y: 0.6em), align: left + horizon)

  // A cell is a box and not a paragraph, so math in it would otherwise be set
  // inline, which puts the limits of a large operator beside it.
  show table: it => {
    show math.equation.where(block: false): math.display
    it
  }
  set footnote.entry(separator: line(length: 30%, stroke: 0.5pt + colors.fg))

  set outline.entry(fill: line(length: 100%, stroke: 0.2pt + colors.fg))

  show outline.entry.where(level: 1): set text(weight: "bold")
  show outline.entry.where(level: 1): set block(above: 1.2em)
  show outline.entry.where(level: 1): set outline.entry(fill: none)

  show link: set text(fill: colors.accent)

  show: math-style.with(font: fonts.math)

  doc
}
