// Simplices and the simplicial complex they form.
#let simp = sym.sigma
#let simpcomp = math.cal("T")

// Spaces of polynomial differential forms. poly(r, k, m) is the space of
// k-forms with coefficients of degree at most r, and polytrim the reduced
// space of the trimmed family.
#let poly(r, k, m) = $cal(P)_#r Lambda^#k (#m)$
#let polytrim(r, k, m) = $cal(P)_#r^- Lambda^#k (#m)$

// Spaces of differential k-forms on a domain, by regularity.
#let forms(k, m) = $Lambda^#k (#m)$
#let l2forms(k, m) = $L^2 Lambda^#k (#m)$
#let hforms(k, m) = $H Lambda^#k (#m)$

// Whitney forms, the lowest-order basis attached to simplices.
#let whitney = math.op("W")

// Chains, cochains, and the boundary operator dual to the exterior derivative.
#let cochains = math.op("C")
#let bdry = sym.partial

// The de Rham complex and the cohomology read off it.
#let derham = math.cal("R")
#let cohom(k) = $H^#k$
