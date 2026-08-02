#import "notation.typ": *

// The mesh and the entity sets carried by it.
#let mesh = math.cal("M")
#let nodes = math.cal("N")
#let cells = math.cal("K")
#let facets = math.cal("F")

// Linear and bilinear forms, set sans to separate them from the functions
// they eat and from the operators they are assembled into.
#let linf(a) = math.sans(a)
#let bilf(a) = math.sans(a)

// Lagrangian finite element spaces. lagrange(p, m) is the space of continuous
// piecewise polynomials of degree p on the mesh m, and lagrange0 its subspace
// with vanishing boundary trace.
#let lagrange(p, m) = $cal(S)^0_#p (#m)$
#let lagrange0(p, m) = $cal(S)^0_(#p\,0) (#m)$
#let discont(p, m) = $cal(S)^(-1)_#p (#m)$

// Mesh size, element diameter and the reference element.
#let msize = $h$
#let refcell = $hat(K)$

// Interpolation and projection onto a discrete space.
#let interp = math.op("I")
#let proj = math.op("P")
