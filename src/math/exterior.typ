#import "notation.typ": *

#let wedge = sym.and
#let bigwedge = math.scripts(math.inline(sym.and.big))

// extpow is the space of k-vectors, altpow of alternating k-forms.
#let extpow(k, v) = $bigwedge^#k #v$
#let altpow(k, v) = $"Alt"^#k (#v)$
#let alt = math.op("Alt")

// Overrides Typst's dif, whose thin space is wrong for an operator.
#let dif = math.class("unary", math.upright($d$))
#let codif = math.class("unary", math.upright($delta$))

#let hodge = math.class("unary", sym.star)
#let sharp = math.class("unary", sym.sharp)
#let flat = math.class("unary", sym.flat)

#let intprod = math.class("unary", sym.iota)
#let lie = math.cal("L")

#let pullback(f) = math.attach(f, tr: sym.ast.op)
#let pushforward(f) = math.attach(f, br: sym.ast.op)

#let vol = math.op("vol")
