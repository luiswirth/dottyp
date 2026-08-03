// The one place the library is imported, and the one place this document says
// how it departs from it. Everything else in src/ imports this file.

#import "@local/dottyp:0.1.0": *

// Named here rather than passed straight in, since the title page reads them
// too and the metadata and the page must not drift apart.
#let title = "Title"
#let author = "Luis Wirth"

#let setup = article-document.with(
  title: title,
  author: author,
  colors: light-theme,
  fonts: serif-fonts,
)
