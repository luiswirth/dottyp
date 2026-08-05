#let section-style(
  // Printed before the chapter number, as in "Chapter 3".
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

// Not a variant of section-style: there is no chapter, no page numbering
// scheme and no pagebreak to parameterize away.
#let notes-style(heading-numbering: "1.1", eq-numbering: none, doc) = {
  set heading(numbering: heading-numbering)

  set math.equation(numbering: eq-numbering)

  doc
}
