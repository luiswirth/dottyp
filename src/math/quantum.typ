// Quantum mechanics, meaning only what is peculiar to it. The adjoint mark
// lives in notation, and the commutator in algebra, since neither is quantum.

#import "notation.typ": *
#import "algebra.typ": angled

// Dirac notation. The bar carries the pairing that inner writes with a comma,
// so a document uses one spelling or the other and not both. In a braket it is
// declared normal, since the default class spaces it like a relation and Dirac
// notation is set tight.
#let ket(a) = math.lr($bar.v #a chevron.r$)
#let bra(a) = math.lr($chevron.l #a bar.v$)
#let braket(a, b) = angled($#a #math.class("normal", sym.bar.v) #b$)

// The rank-one operator, which is how a projector and a spectral decomposition
// are written.
#let ketbra(a, b) = ket(a) + bra(b)

// The marks distinguishing the four Green's functions of the Keldysh formalism,
// as superscripts on whichever letter a document gives them. Upright rather
// than the sans of herm, which is what the transport literature draws.
#let ret = math.upright("R")
#let adv = math.upright("A")
#let lesser = math.lt
#let greater = math.gt
