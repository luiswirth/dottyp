// Exercises every definition in the library. If this compiles, no name is
// broken; look at the output to check that each one also renders as intended.

#import "@local/dottyp:0.1.0": *
#import "@local/dottyp:0.1.0": aliases
#import aliases: *

#show: math-style.with(numbering: none)
#set page(paper: "a4", margin: 1.5cm)
#set text(font: "New Computer Modern Sans", size: 9pt)
#set heading(numbering: "1.1")

#let row(name, body) = (raw(name), body)
#let sheet(..pairs) = table(
  columns: (auto, 1fr, auto, 1fr),
  stroke: none,
  align: (right + horizon, left + horizon, right + horizon, left + horizon),
  inset: (x: 5pt, y: 3.5pt),
  ..pairs.pos().flatten(),
)

= Notation

#sheet(
  row("avec", $avec(v)$), row("amat", $amat(A)$),
  row("tens", $tens(T)$), row("vvec", $vvec(v)$),
  row("nvec", $nvec(n)$), row("ii", $ii$),
  row("conj", $conj(z)$), row("clos", $clos(Omega)$),
  row("restr", $restr(f, s: Gamma)$), row("restr bare", $restr(f)$),
  row("transp", $amat(A)^transp$), row("herm", $amat(A)^herm$),
  row("approxmag", $approxmag 10^(-3)$), row("", []),
)

= Algebra

#sheet(
  row("lin", $lin(U, V)$), row("ker", $ker T$),
  row("im", $im T$), row("rank", $rank amat(A)$),
  row("tr", $tr amat(A)$), row("det", $det amat(A)$),
  row("diag", $diag(lambda_1, lambda_2)$), row("sgn", $sgn x$),
  row("span", $span_(i) {v_i}$), row("Re", $Re z$),
  row("Im", $Im z$), row("angled", $angled(x)$),
  row("inner", $inner(u, v)$), row("dual", $dual(f, x)$),
  row("innerlines", $innerlines(u, v)$), row("tprod", $U tprod V$),
  row("dsum", $U dsum V$), row("bigdsum", $bigdsum_(k) V_k$),
)

= Analysis

#sheet(
  row("oo", $oo(a, b)$), row("cc", $cc(a, b)$),
  row("oc", $oc(a, b)$), row("co", $co(a, b)$),
  row("deriv", $deriv(f, x)$), row("deriv n:2", $deriv(f, x, n: 2)$),
  row("pderiv", $pderiv(u, t)$), row("pderiv n:2", $pderiv(u, t, n: 2)$),
  row("dom", $dom T$), row("supp", $supp f$),
  row("esssup", $esssup_(x in Omega) f$), row("essinf", $essinf_(x in Omega) f$),
  row("norm", $norm(u)_(L^2)$), row("abs", $abs(x)$),
  row("argmin", $argmin_(x in K) J(x)$), row("argmax", $argmax_(x in K) J(x)$),
  row("bigo", $bigo(h^2)$), row("smallo", $smallo(h)$),
)

= Function spaces

#sheet(
  row("H0", $H0^1(Omega)$), row("Hvec", $Hvec^1(Omega)$),
  row("H0vec", $H0vec^1(Omega)$), row("Hgrad", $Hgrad$),
  row("Hcurl", $Hcurl$), row("Hdiv", $Hdiv$),
  row("cont", $cont^0(clos(Omega))$), row("smooth", $smooth (Omega)$),
  row("smoothc", $smoothc (Omega)$), row("distr", $distr'(Omega)$),
  row("dualspace", $dualspace(V)$), row("", []),
)

= Vector calculus

#sheet(
  row("grad", $grad u$), row("curl", $curl avec(E)$),
  row("div", $div avec(B)$), row("scurl", $scurl avec(u)$),
  row("rot", $rot avec(u)$), row("lapl", $lapl u$),
  row("dalem", $dalem u$), row("", []),
)

= Exterior calculus

#sheet(
  row("wedge", $alpha wedge beta$), row("bigwedge", $bigwedge^k V$),
  row("extpow", $extpow(k, V)$), row("altpow", $altpow(k, V)$),
  row("alt", $alt(V)$), row("dif", $dif omega$),
  row("codif", $codif omega$), row("hodge", $hodge omega$),
  row("sharp", $alpha^sharp$), row("flat", $avec(v)^flat$),
  row("intprod", $intprod_avec(v) omega$), row("lie", $lie_avec(v) omega$),
  row("pullback", $pullback(phi) omega$), row("pushforward", $pushforward(phi) avec(v)$),
  row("vol", $vol(Omega)$), row("", []),
)

= Finite elements

#sheet(
  row("mesh", $mesh$), row("nodes", $nodes$),
  row("cells", $cells$), row("facets", $facets$),
  row("linf", $linf(l)(v)$), row("bilf", $bilf(a)(u, v)$),
  row("lagrange", $lagrange(1, mesh)$), row("lagrange0", $lagrange0(1, mesh)$),
  row("discont", $discont(0, mesh)$), row("", []),
  row("msize", $msize$), row("refcell", $refcell$),
  row("interp", $interp_msize u$), row("proj", $proj_msize u$),
)

= FEEC

#sheet(
  row("simp", $simp$), row("simpcomp", $simpcomp$),
  row("poly", $poly(r, k, mesh)$), row("polytrim", $polytrim(r, k, mesh)$),
  row("forms", $forms(k, Omega)$), row("l2forms", $l2forms(k, Omega)$),
  row("hforms", $hforms(k, Omega)$), row("whitney", $whitney_simp$),
  row("cochains", $cochains^k (simpcomp)$), row("bdry", $bdry simp$),
  row("derham", $derham$), row("cohom", $cohom(k)(Omega)$),
)

= Probability

#sheet(
  row("prob", $prob(A)$), row("expect", $expect[X]$),
  row("variance", $variance[X]$), row("cov", $cov(X, Y)$),
  row("corr", $corr(X, Y)$), row("given", $prob(A given B)$),
  row("distas", $X distas normal(0, 1)$), row("iid", $X_i iid normal(0, 1)$),
  row("normal", $normal(mu, Sigma)$), row("uniform", $uniform(0, 1)$),
  row("bernoulli", $bernoulli(p)$), row("poisson", $poisson(lambda)$),
  row("gammadist", $gammadist(alpha, beta)$), row("gp", $gp(m, kernel)$),
  row("kernel", $kernel(x, x')$), row("gram", $gram$),
  row("entropy", $entropy[X]$), row("kl", $kl(p || q)$),
  row("mutinfo", $mutinfo(X; Y)$), row("", []),
  row("filtration", $filtration_t$),
  row("quadvar", $quadvar(X)_t$),
  row("ito", $ito$), row("brown", $dif brown_t$),
  row("noise", $noise_t$), row("convdist", $X_n convdist X$),
  row("convprob", $X_n convprob X$), row("convas", $X_n convas X$),
)

= Aliases

#sheet(
  row("xv", $xv$), row("Ev", $Ev$),
  row("nn", $nn$), row("zv", $zv$),
)

= Style

#sheet(
  row("numeq", numeq($a^2 + b^2 = c^2$)),
  row("", []), row("", []), row("", []),
)
