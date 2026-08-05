#import "notation.typ": *

#let prob = math.op(math.bb("P"))
#let expect = math.op(math.bb("E"))
#let variance = math.op(math.bb("V"))
#let cov = math.op("Cov")
#let corr = math.op("Corr")

#let given = math.class("binary", sym.bar.v)
#let distas = math.class("relation", sym.tilde)
#let iid = math.class("relation", $tilde.op^"iid"$)

#let normal = math.cal("N")
#let uniform = math.op("Unif")
#let bernoulli = math.op("Bern")
#let poisson = math.op("Poi")
#let gammadist = math.op("Gam")

// The covariance kernel is spelled out, ker being the kernel of a map.
#let gp = math.cal("G") + math.cal("P")
#let kernel = $k$
#let gram = amat("K")

#let entropy = math.op("H")
#let kl = math.op("KL")
#let tvdist = math.op("TV")
#let mutinfo = math.op("I")

// White noise is the distributional derivative of Brownian motion, so the two
// never share a letter.
#let brown = $B$
#let noise = $xi$
#let filtration = math.cal("F")
#let quadvar(a) = $lr(\[ #a \])$
#let ito = math.op("Itô")

#let eqdist = math.class("relation", $=^d$)

#let convdist = math.class("relation", $arrow.r^d$)
#let convprob = math.class("relation", $arrow.r^p$)
#let convas = math.class("relation", $arrow.r^"a.s."$)
