#import "notation.typ": *

// The exterior product, and the big operator built from it.
#let wedge = sym.and
#let bigwedge = math.scripts(math.inline(sym.and.big))

// The exterior algebra and its graded pieces. extpow(k, V) is the space of
// k-vectors over V, altpow(k, V) the space of alternating k-forms on it.
#let extpow(k, v) = $bigwedge^#k #v$
#let altpow(k, v) = $"Alt"^#k (#v)$
#let alt = math.op("Alt")

// The formal adjoint of the exterior derivative. The exterior derivative is
// Typst's own dif, which already sets an upright d and spaces it correctly.
#let codif = math.upright($delta$)

// The Hodge star, and the musical isomorphisms raising and lowering indices.
#let hodge = math.class("unary", sym.star)
#let sharp = math.class("unary", sym.sharp)
#let flat = math.class("unary", sym.flat)

// Interior product and Lie derivative.
#let intprod = math.class("unary", sym.iota)
#let lie = math.cal("L")

// Pullback and pushforward along a map, starred above and below respectively.
#let pullback(f) = math.attach(f, tr: sym.ast.op)
#let pushforward(f) = math.attach(f, br: sym.ast.op)

// Volume form and the integral of a form over a chain.
#let vol = math.op("vol")
