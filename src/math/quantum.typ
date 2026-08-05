// Only what is peculiar to quantum mechanics: the adjoint mark lives in
// notation and the commutator in algebra, since neither is.

#import "notation.typ": *
#import "algebra.typ": angled

// The bar in a braket is declared normal, the default class spacing it like a
// relation where Dirac notation is set tight.
#let ket(a) = math.lr($bar.v #a chevron.r$)
#let bra(a) = math.lr($chevron.l #a bar.v$)
#let braket(a, b) = angled($#a #math.class("normal", sym.bar.v) #b$)

#let ketbra(a, b) = ket(a) + bra(b)

// The four Green's function marks of the Keldysh formalism, superscripts on
// whichever letter a document gives them. Upright is what the transport
// literature draws.
#let ret = math.upright("R")
#let adv = math.upright("A")
#let lesser = math.lt
#let greater = math.gt
