#import "setup.typ": *
#show: setup

#preface-style[
  #include "title.typ"
  #outline()
]

#body-style[
  #include "matter/01-introduction.typ"
]

#appendix-style[
  #include "appendix/01-derivations.typ"
]

#postface-style[
  #bibliography("bibliography.bib", style: "chicago-author-date")
]
