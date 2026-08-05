#import "notation.typ": *

// Linear maps and their invariants.
#let lin = math.op("Lin")
#let ker = math.op("ker")
#let im = math.op("im")
#let rank = math.op("rank")
#let tr = math.op("tr")
#let det = math.op("det")
#let diag = math.op("diag")
#let sgn = math.op("sgn")
#let span = math.op("span", limits: true)

// Upright Re and Im, in preference to the fraktur letters, which read poorly
// at small sizes and next to upright operators.
#let Re = math.op("Re")
#let Im = math.op("Im")

// Angle brackets, and the pairings written with them.
#let angled(a) = math.lr($chevron.l #a chevron.r$)
#let inner(a, b) = angled($#a, #b$)
#let dual(a, b) = angled($#a, #b$)

// The same pairing when the arguments are long enough to want their own lines.
#let innerlines(a, b) = angled(math.vec(delim: none, a, b))

// The Lie bracket of two maps, and its symmetric counterpart. Both measure a
// failure to commute, so neither belongs to any one theory that writes them.
#let commutator(a, b) = math.lr($[#a, #b]$)
#let anticommutator(a, b) = math.lr($\{#a, #b\}$)

// Products and sums of spaces.
#let tprod = sym.times.o
#let dsum = sym.plus.o
#let bigdsum = math.scripts(math.inline(sym.plus.o.big))
