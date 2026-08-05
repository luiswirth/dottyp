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
