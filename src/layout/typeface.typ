// The faces a document is set in. Text and math are one choice and not two,
// since the only thing that makes a page look assembled out of parts is prose
// in one family and formulas in another.
//
// Both families are New Computer Modern, which carries a matching math face,
// so a document picks a family rather than a pair of fonts.

#let serif-fonts = (
  text: "New Computer Modern",
  math: "New Computer Modern Math",
)

#let sans-fonts = (
  text: "New Computer Modern Sans",
  math: "New Computer Modern Sans Math",
)
