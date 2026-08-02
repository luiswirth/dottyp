#import "notation.typ": *

// Measure-theoretic ground: the sample space, its sigma-algebra, the measure.
#let prob = math.op(math.bb("P"))
#let expect = math.op(math.bb("E"))
#let variance = math.op(math.bb("V"))
#let cov = math.op("Cov")
#let corr = math.op("Corr")

// Conditioning and distribution, both written with a bar or a tilde whose
// spacing has to survive being surrounded by long expressions.
#let given = math.class("binary", sym.bar.v)
#let distas = math.class("relation", sym.tilde)
#let iid = math.class("relation", $tilde.op^"iid"$)

// Named distributions.
#let normal = math.cal("N")
#let uniform = math.op("Unif")
#let bernoulli = math.op("Bern")
#let poisson = math.op("Poi")
#let gammadist = math.op("Gam")

// Gaussian processes and the objects a kernel method is written with.
// The kernel itself is plain k, which needs no name to be typed.
#let gp = math.cal("G") + math.cal("P")
#let gram = amat("K")

// Information-theoretic quantities.
#let entropy = math.op("H")
#let kl = math.op("KL")
#let mutinfo = math.op("I")

// Stochastic calculus: the quadratic variation and the filtration the process
// is adapted to. Brownian motion is B and white noise is xi: white noise is the
// distributional derivative of Brownian motion, so the two never share a letter.
#let filtration = math.cal("F")
#let quadvar(a) = $lr(\[ #a \])$
#let ito = math.op("Itô")

// Convergence, in the three modes that need distinguishing.
#let convdist = math.class("relation", $arrow.r^d$)
#let convprob = math.class("relation", $arrow.r^p$)
#let convas = math.class("relation", $arrow.r^"a.s."$)
