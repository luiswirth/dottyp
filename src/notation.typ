// How a symbol is dressed according to what it denotes.
// The weight carries the rank, the accent carries the extra structure.

#let avec(a) = math.bold(a)
#let amat(a) = math.upright(math.bold(a))
#let tens(a) = math.sans(math.bold(a))

// Vectors that need their arrow-ness visible, as in an elementary text.
#let vvec(a) = math.accent(math.bold(a), math.arrow)
#let nvec(a) = math.accent(avec(a), math.hat)

// The imaginary unit, dotless so the dot does not collide with an accent.
#let ii = $dotless.i$

// Complex conjugate and topological closure share a glyph but not a meaning.
#let conj(a) = math.overline(a)
#let clos(a) = math.overline(a)

// Restriction of f to s, or the bare bar when the domain is left implicit.
#let restr(f, s: none) = if s == none { $lr(#f|)$ } else { $lr(#f|)_#s$ }

// Adjoints. Both marks render as the same glyph in most fonts; the names
// distinguish the real transpose from the conjugate one.
#let transp = math.top
#let herm = math.upright(math.sans("H"))

// A tight tilde meaning "of the order of", unary so it takes no operator spacing.
#let approxmag = math.class("unary", sym.tilde.op)
