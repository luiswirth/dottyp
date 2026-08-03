// The one place the library is imported, and the one place this document says
// how it departs from it. Everything else in src/ imports this file.

#import "@local/dottyp:0.1.0": *

#let title = "Title"
#let author = "Luis Wirth"

#let setup = notes-document.with(
  title: title,
  author: author,
  colors: dark-theme,
  fonts: serif-fonts,
)
