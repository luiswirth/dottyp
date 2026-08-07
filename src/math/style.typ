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
    if it.numbering == none {
      it
    } else if type(it.numbering) == function {
      // Tagged, so it prints its name and takes no number with it.
      it
      counter(math.equation).update(n => n - 1)
    } else if it.has("label") {
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

// An equation the field has named is cited by that name rather than by a
// number, at the display and at every reference. Its label is spelled as the
// tag prints, <BTE>, so the two cannot drift apart.
//
// The tag is set on the equation rather than drawn onto it, which is what
// leaves the reference to Typst. One rule reaches one label, so the list is
// folded over the body.
#let tag-equations(names, body) = {
  let fold(names, body) = {
    if names.len() == 0 { return body }
    [
      #show label(names.first()): set math.equation(
        numbering: _ => "(" + names.first() + ")",
      )
      #fold(names.slice(1), body)
    ]
  }

  fold(names, body)

  // A tag names a label that lives elsewhere in the document, which is the one
  // thing here that can silently fall apart.
  context assert(
    names.all(name => query(label(name)).len() > 0),
    message: "tag-equations names an equation that does not exist",
  )
}
