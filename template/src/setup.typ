#import "@local/dottyp:0.1.0": *

// Named here, since the title block reads them too and the two must not drift
// apart.
#let title = "Title"
#let author = "Luis Wirth"

#let setup = notes-document.with(
  title: title,
  author: author,
  colors: light-theme,
  fonts: serif-fonts,
)
