#import "notation.typ": *

#let lin = math.op("Lin")
#let ker = math.op("ker")
#let im = math.op("im")
#let rank = math.op("rank")
#let tr = math.op("tr")
#let det = math.op("det")
#let diag = math.op("diag")
#let sgn = math.op("sgn")
#let span = math.op("span", limits: true)

// Upright rather than the fraktur letters, which read poorly at small sizes.
#let Re = math.op("Re")
#let Im = math.op("Im")

#let angled(a) = math.lr($chevron.l #a chevron.r$)
#let inner(a, b) = angled($#a, #b$)
#let dual(a, b) = angled($#a, #b$)

#let innerlines(a, b) = angled(math.vec(delim: none, a, b))

#let commutator(a, b) = math.lr($[#a, #b]$)
#let anticommutator(a, b) = math.lr($\{#a, #b\}$)

#let tprod = sym.times.o
#let dsum = sym.plus.o
#let bigdsum = math.scripts(math.inline(sym.plus.o.big))
