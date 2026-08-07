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

#let notes-document(..args, body) = article-document(
  ..args,
  {
    show: notes-style
    body
  },
)

// A section opening with an outline of itself, for a document long enough that
// a chapter is found rather than read front to back.
//
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
