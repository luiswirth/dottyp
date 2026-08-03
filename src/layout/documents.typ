// Whole documents, as against the styles they are composed of. A project binds
// the title and the look once, and its files apply the result, so the order the
// rules go on in is stated here and not repeated per project.

#import "theme.typ": *
#import "typeface.typ": *
#import "template.typ": document-style
#import "sections.typ": notes-style
#import "theorems.typ": thmrules

#let article-document(
  title: none,
  author: none,
  colors: light-theme,
  fonts: serif-fonts,
  body,
) = {
  set document(title: title, author: author)
  show: document-style.with(colors: colors, fonts: fonts)
  show: thmrules
  body
}

// The same, for a document whose headings are numbered and whose sections
// start nothing on a fresh page.
#let notes-document(..args, body) = article-document(
  ..args,
  {
    show: notes-style
    body
  },
)

// A part divider in a document assembled from several files. Each such file
// sets the page so that it also compiles alone, and a set page rule issued
// after content exists starts a new one, so a part heading would sit alone
// above the first file whatever it did. It is therefore drawn as a title page.
//
// The files gathered under it are shifted one level down, which is what lets
// each of them write its own title as = wherever it is compiled.
#let area(name, body) = {
  show heading.where(level: 1): it => page(
    align(center + horizon, text(size: 25pt, weight: "bold", it.body)),
  )
  heading(level: 1, name)
  set heading(offset: 1)
  body
}
