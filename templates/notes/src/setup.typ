// The one place the library is imported, and the one place this document says
// how it departs from it. Everything else in src/ imports this file.

#import "@local/dottyp:0.1.0": *

#let title = "Title"
#let author = "Luis Wirth"

// The whole document is drawn in this one, light-theme or dark-theme.
#let colors = dark-theme

#let setup(body) = {
  set document(title: title, author: author)
  show: document-style.with(colors: colors)
  show: notes-style
  show: thmrules
  body
}
