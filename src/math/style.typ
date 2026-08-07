#let math-style(font: "New Computer Modern Math", doc) = {
  show math.equation: set text(font: font)
  set math.mat(delim: "[")
  set math.vec(delim: "[")
  set math.equation(numbering: "(1)")

  // An equation earns a number by being referenced, and a label is what a
  // reference needs, so the labelled displays are exactly the numbered ones.
  // Numbering is therefore never a document's choice: it is on, and an
  // unreferenced display shows nothing anyway.
  show math.equation.where(block: true): it => {
    if it.numbering == none or it.has("label") {
      it
    } else {
      math.equation(block: true, numbering: none, it.body)
      counter(math.equation).update(n => n - 1)
    }
  }

  // A reference to an equation shows only its number, as (3) rather than
  // Equation 3.
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(), std.numbering(
        el.numbering,
        ..counter(math.equation).at(el.location()),
      ))
    } else {
      it
    }
  }

  doc
}
