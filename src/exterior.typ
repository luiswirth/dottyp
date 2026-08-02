#import "notation.typ": *

// The exterior product, and the big operator built from it.
#let wedge = math.and
#let wedgespace = math.scripts(math.inline(math.and.big))

// The exterior algebra and its graded pieces. extpow(k, V) is the space of
// k-vectors over V, altpow(k, V) the space of alternating k-forms on it.
#let extpow(k, v) = $wedgespace^#k #v$
#let altpow(k, v) = $"Alt"^#k (#v)$
#let alt = math.op("Alt")

// The exterior derivative and its formal adjoint. Both are unary, so they
// bind tightly to the form they act on rather than taking operator spacing.
#let dif = math.class("unary", math.upright($d$))
#let codif = math.class("unary", math.upright($delta$))

// The Hodge star, and the musical isomorphisms raising and lowering indices.
#let hodge = math.class("unary", math.star)
#let sharp = math.class("unary", sym.sharp)
#let flat = math.class("unary", sym.flat)

// Interior product and Lie derivative.
#let intprod = math.class("unary", math.iota)
#let lie = math.cal("L")

// Pullback and pushforward along a map, starred above and below respectively.
#let pullback(f) = math.attach(f, tr: sym.ast.op)
#let pushforward(f) = math.attach(f, br: sym.ast.op)

// Volume form and the integral of a form over a chain.
#let vol = math.op("vol")
