#import "notation.typ": *

#let mesh = math.cal("M")
#let nodes = math.cal("N")
#let cells = math.cal("K")
#let facets = math.cal("F")

// Sans separates a form from the functions it eats and from the operators it
// is assembled into.
#let linf(a) = math.sans(a)
#let bilf(a) = math.sans(a)

// lagrange is the continuous piecewise polynomials of degree p, lagrange0 its
// subspace with vanishing boundary trace, discont the discontinuous ones.
#let lagrange(p, m) = $cal(S)^0_#p (#m)$
#let lagrange0(p, m) = $cal(S)^0_(#p\,0) (#m)$
#let discont(p, m) = $cal(S)^(-1)_#p (#m)$

#let msize = $h$
#let refcell = $hat(K)$

#let interp = math.op("I")
#let proj = math.op("P")
