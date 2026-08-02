#import "notation.typ": *

// Sobolev spaces. The open circle marks the subspace with vanishing trace,
// in preference to a zero subscript, which the order index already uses.
#let H0 = $limits(H)^circle.stroked.small$
#let Hvec = $avec(H)$
#let H0vec = $limits(Hvec)^circle.stroked.small$

// The de Rham complex in its vector-proxy form takes the domain of each
// first-order operator as a space in its own right.
#let Hgrad = $H(bold("grad"))$
#let Hcurl = $H(bold("curl"))$
#let Hdiv = $H("div")$

// Spaces of continuous and smooth functions, and of distributions.
#let cont = math.cal("C")
#let smooth = $cal(C)^infinity$
#let compactsupp = $cal(C)_c^infinity$
#let distr = math.cal("D")

// Duality: the topological dual of a space.
#let dualspace(v) = $#v '$
