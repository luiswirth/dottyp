#let simp = sym.sigma
#let simpcomp = math.cal("T")

// poly is the space of k-forms with coefficients of degree at most r, polytrim
// the reduced space of the trimmed family.
#let poly(r, k, m) = $cal(P)_#r Lambda^#k (#m)$
#let polytrim(r, k, m) = $cal(P)_#r^- Lambda^#k (#m)$

#let forms(k, m) = $Lambda^#k (#m)$
#let l2forms(k, m) = $L^2 Lambda^#k (#m)$
#let hforms(k, m) = $H Lambda^#k (#m)$

#let whitney = math.op("W")

#let cochains = math.op("C")
#let bdry = sym.partial

#let derham = math.cal("R")
#let cohom(k) = $H^#k$
