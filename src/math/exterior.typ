#import "notation.typ": *

// The exterior product, and the big operator built from it.
#let wedge = sym.and
#let bigwedge = math.scripts(math.inline(sym.and.big))

// The exterior algebra and its graded pieces. extpow(k, V) is the space of
// k-vectors over V, altpow(k, V) the space of alternating k-forms on it.
#let extpow(k, v) = $bigwedge^#k #v$
#let altpow(k, v) = $"Alt"^#k (#v)$
#let alt = math.op("Alt")

// The exterior derivative and its formal adjoint, both unary so they bind to
// the form they act on. This deliberately overrides Typst's dif, which sets a
// thin space before the d: right for the dx of an integral, wrong for an
// operator, and compositions like hodge dif hodge are what this notation is for.
#let dif = math.class("unary", math.upright($d$))
#let codif = math.class("unary", math.upright($delta$))

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
