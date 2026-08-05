#let avec(a) = math.bold(a)
#let amat(a) = math.upright(math.bold(a))
#let tens(a) = math.sans(math.bold(a))

// For an elementary text, where the arrow has to be visible.
#let vvec(a) = math.accent(math.bold(a), math.arrow)
#let nvec(a) = math.accent(avec(a), math.hat)

// Dotless, so the dot does not collide with an accent.
#let ii = $dotless.i$

// One glyph, two meanings, hence two names.
#let conj(a) = math.overline(a)
#let clos(a) = math.overline(a)

#let restr(f, s: none) = if s == none { $lr(#f|)$ } else { $lr(#f|)_#s$ }

// A document spells the conjugate transpose as herm or as the builtin dagger,
// and never alternates.
#let transp = sym.top
#let herm = math.upright(math.sans("H"))

// A tight tilde meaning "of the order of".
#let approxmag = math.class("unary", sym.tilde.op)
