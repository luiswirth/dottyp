#let math-style(
  font: "New Computer Modern Math",
  delim: "[",
  numbering: "(1)",
  bare-eq-refs: true,
  doc,
) = {
  show math.equation: set text(font: font)
  set math.mat(delim: delim)
  set math.vec(delim: delim)
  set math.equation(numbering: numbering)

  // A reference to an equation shows only its number, as (3) rather than
  // Equation 3.
  show ref: it => {
    let el = it.element
    if bare-eq-refs and el != none and el.func() == math.equation {
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

#let numeq(body) = math.equation(block: true, numbering: "(1)", body)
