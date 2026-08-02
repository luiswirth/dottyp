#import "theme.typ": palette

// How a stretch of a document numbers its pages and sets its headings.
//
// A thesis is four such stretches, differing only in the arguments below, so
// the four presets are applications of one function rather than four copies.

#let section-style(
  // Printed before the chapter number on a level-one heading, as in
  // "Chapter 3". None leaves the heading bare.
  label: none,
  heading-numbering: none,
  page-numbering: "1",
  reset-pagecount: false,
  outline-subheadings: true,
) = doc => {
  set page(numbering: page-numbering)
  if reset-pagecount { counter(page).update(1) }

  set heading(numbering: heading-numbering)
  counter(heading).update(0)

  show heading.where(level: 2): set heading(outlined: outline-subheadings)
  show heading.where(level: 3): set heading(outlined: outline-subheadings)
  show heading.where(level: 4): set heading(numbering: none)

  show heading: it => {
    if it.level == 1 {
      pagebreak(weak: true)
      v(50pt)
      if label != none and it.numbering != none {
        text(size: 18pt)[#label #counter(heading).display()]
        v(0pt)
      }
      text(size: 25pt)[#it.body]
      v(20pt)
    } else {
      let size = 22pt - 3pt * (it.level - 1)
      block(sticky: true, above: size, below: size, {
        set text(size, weight: "bold")
        if it.numbering != none {
          counter(heading).display()
          h(size, weak: true)
        }
        it.body
      })
    }
  }

  doc
}

#let preface-style = section-style(
  page-numbering: "I",
)

#let body-style = section-style(
  label: "Chapter",
  heading-numbering: "1.1.1",
  reset-pagecount: true,
)

#let appendix-style = section-style(
  label: "Appendix",
  heading-numbering: "A.1.1",
  outline-subheadings: false,
)

#let postface-style = section-style(
  page-numbering: "i",
  reset-pagecount: true,
)

// Lecture notes and summaries, where a section is a band across the page and
// nothing starts on a fresh one. Not a variant of section-style: there is no
// chapter, no page numbering scheme and no pagebreak to parameterize away.
#let notes-style(heading-numbering: "1.1", eq-numbering: none, doc) = {
  set heading(numbering: heading-numbering)

  // Nothing points at an equation in a note, so nothing numbers one.
  set math.equation(numbering: eq-numbering)

  show heading: it => context block(
    fill: palette.get().surface,
    inset: 0.3em,
    radius: 0.2em,
    width: 100%,
    sticky: true,
    {
      set text(size: 16pt - 2pt * (it.level - 1), weight: "bold")
      if it.numbering != none {
        counter(heading).display()
        h(0.5em, weak: true)
      }
      it.body
    },
  )

  doc
}
