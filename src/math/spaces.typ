#import "notation.typ": *

// The open circle marks vanishing trace, the zero subscript being taken by the
// order index.
#let H0 = $limits(H)^circle.stroked.small$
#let Hvec = $avec(H)$
#let H0vec = $limits(Hvec)^circle.stroked.small$

#let Hgrad = $H(bold("grad"))$
#let Hcurl = $H(bold("curl"))$
#let Hdiv = $H("div")$

#let cont = math.cal("C")
#let smooth = $cal(C)^infinity$
#let smoothc = $cal(C)_c^infinity$
#let distr = math.cal("D")

#let dualspace(v) = $#v '$
