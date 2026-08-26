#import "theme.typ": *
#import "typeface.typ": *
#import "template.typ": document-style
#import "sections.typ": notes-style
#import "theorems.typ": thmrules

#let article-document(
  title: none,
  author: (),
  colors: light-theme,
  fonts: serif-fonts,
  body,
) = {
  set document(title: title, author: author)
  show: document-style.with(colors: colors, fonts: fonts)
  show: thmrules
  body
}

// A thesis is set tighter and denser than an article: it is read as a bound
// document rather than a few pages, and its front matter, body and appendix
// each carry their own numbering, which the section styles supply.
#let thesis-document(
  title: none,
  author: (),
  colors: light-theme,
  fonts: sans-fonts,
  body,
) = {
  set document(title: title, author: author)
  show: document-style.with(
    colors: colors,
    fonts: fonts,
    margin: 2cm,
    size: 10pt,
    justify: true,
    number-unlabelled: true,
  )
  show: thmrules
  body
}

#let notes-document(..args, body) = article-document(
  ..args,
  {
    show: notes-style
    body
  },
)

// The sections are found by location rather than by walking the body, which is
// the only description that survives a section being wrapped in anything.
#let chapter(title, body) = {
  pagebreak(weak: true)
  heading(level: 1, title)

  context {
    let start = here()
    let sections = selector(heading).after(start)
    let following = query(heading.where(level: 1).after(start))
    if following.len() > 0 {
      sections = sections.before(following.first().location())
    }
    outline(title: none, target: sections, depth: 3)
  }

  body
}

// Drawn as a title page because it cannot be a plain heading: every gathered
// file sets the page so that it also compiles alone, and a set page rule issued
// after content exists starts a new page anyway.
//
// The offset lets each gathered file write its own title as = when compiled
// alone.
#let area(name, body) = {
  show heading.where(level: 1): it => page(
    align(center + horizon, text(size: 25pt, weight: "bold", it.body)),
  )
  heading(level: 1, name)
  set heading(offset: 1)
  body
}

// Drawn rather than composed from headings: the page sets itself, and a set
// page rule issued once content exists would start another one.
//
// Every part is optional and every part is content, so the institution lives in
// the document that hands the thesis in, logo and all.
#let title-page(
  logo: none,
  kind: none,
  title: none,
  abstract: none,
  author: none,
  contact: none,
  supervisor: none,
  affiliation: none,
  date: none,
) = context {
  let colors = palette.get()

  set page(footer: none)

  // The page carries no visible heading, but the outline lists it like every
  // other front-matter part, so it takes a hidden one.
  show heading: none
  heading(outlined: true)[Title]

  logo

  set align(center + horizon)
  set text(12pt)

  if kind != none {
    text(20pt, kind)
    v(1cm)
  }

  if title != none {
    text(25pt, strong(title))
  }

  if abstract != none {
    block(
      stroke: (left: 0.5pt + colors.fg, right: 0.5pt + colors.fg),
      fill: colors.surface,
      inset: 5pt,
      {
        set text(10pt)
        strong("Abstract")
        linebreak()
        set align(left)
        abstract
      },
    )
  }

  if author != none {
    v(0.3cm)
    text(20pt, emph(author))
    linebreak()
  }

  if contact != none {
    text(13pt, contact)
  }

  if supervisor != none {
    v(0.5cm)
    [Supervised by]
    v(-0.1cm)
    text(16pt, emph(supervisor))
  }

  if affiliation != none {
    linebreak()
    affiliation
  }

  if date != none {
    set align(bottom)
    text(15pt, date)
  }
}
