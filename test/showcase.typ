// An export missing from a sheet, and a name here that no longer exists, both
// fail the compile. That a definition renders as intended is checked by looking.

#import "@local/dottyp:0.1.0": *
#import "@local/dottyp:0.1.0": aliases, algebra, analysis, exterior, feec, fem, notation, probability, quantum, spaces, style, vector-calculus
#import aliases: *

#show: math-style
#set page(paper: "a4", margin: 1.5cm)
#set text(font: "New Computer Modern Sans", size: 9pt)
#set heading(numbering: "1.1")

#let row(name, body) = (raw(name), body)

// Exercised by the show rule above rather than by a row of its own.
#let shown-elsewhere = ("math-style",)

#let sheets = (
  "Notation": (
    row("avec", $avec(v)$), row("amat", $amat(A)$),
    row("tens", $tens(T)$), row("vvec", $vvec(v)$),
    row("nvec", $nvec(n)$), row("ii", $ii$),
    row("conj", $conj(z)$), row("clos", $clos(Omega)$),
    row("restr", $restr(f, s: Gamma)$), row("restr bare", $restr(f)$),
    row("transp", $amat(A)^transp$), row("herm", $amat(A)^herm$),
    row("approxmag", $approxmag 10^(-3)$), row("unit", $mu unit(c m^2 slash (V s))$),
    row("qty", $qty(9.81, m slash s^2)$), row("", []),
  ),
  "Algebra": (
    row("lin", $lin(U, V)$), row("ker", $ker T$),
    row("im", $im T$), row("rank", $rank amat(A)$),
    row("tr", $tr amat(A)$), row("det", $det amat(A)$),
    row("diag", $diag(lambda_1, lambda_2)$), row("sgn", $sgn x$),
    row("span", $span_(i) {v_i}$), row("Re", $Re z$),
    row("Im", $Im z$), row("angled", $angled(x)$),
    row("inner", $inner(u, v)$), row("dual", $dual(f, x)$),
    row("innerlines", $innerlines(u, v)$), row("commutator", $commutator(amat(A), amat(B))$),
    row("anticommutator", $anticommutator(amat(A), amat(B))$), row("tprod", $U tprod V$),
    row("dsum", $U dsum V$), row("bigdsum", $bigdsum_(k) V_k$),
  ),
  "Analysis": (
    row("oo", $oo(a, b)$), row("cc", $cc(a, b)$),
    row("oc", $oc(a, b)$), row("co", $co(a, b)$),
    row("deriv", $deriv(f, x)$), row("deriv n:2", $deriv(f, x, n: 2)$),
    row("pderiv", $pderiv(u, t)$), row("pderiv n:2", $pderiv(u, t, n: 2)$),
    row("dom", $dom T$), row("supp", $supp f$),
    row("esssup", $esssup_(x in Omega) f$), row("essinf", $essinf_(x in Omega) f$),
    row("norm", $norm(u)_(L^2)$), row("abs", $abs(x)$),
    row("argmin", $argmin_(x in K) J(x)$), row("argmax", $argmax_(x in K) J(x)$),
    row("bigo", $bigo(h^2)$), row("smallo", $smallo(h)$),
  ),
  "Function spaces": (
    row("H0", $H0^1(Omega)$), row("Hvec", $Hvec^1(Omega)$),
    row("H0vec", $H0vec^1(Omega)$), row("Hgrad", $Hgrad$),
    row("Hcurl", $Hcurl$), row("Hdiv", $Hdiv$),
    row("cont", $cont^0(clos(Omega))$), row("smooth", $smooth (Omega)$),
    row("smoothc", $smoothc (Omega)$), row("distr", $distr'(Omega)$),
    row("dualspace", $dualspace(V)$), row("", []),
  ),
  "Vector calculus": (
    row("grad", $grad u$), row("curl", $curl avec(E)$),
    row("div", $div avec(B)$), row("scurl", $scurl avec(u)$),
    row("rot", $rot avec(u)$), row("lapl", $lapl u$),
    row("dalem", $dalem u$), row("hess", $hess u$),
  ),
  "Exterior calculus": (
    row("wedge", $alpha wedge beta$), row("bigwedge", $bigwedge^k V$),
    row("extpow", $extpow(k, V)$), row("altpow", $altpow(k, V)$),
    row("alt", $alt(V)$), row("dif", $dif omega$),
    row("codif", $codif omega$), row("hodge", $hodge omega$),
    row("sharp", $alpha^sharp$), row("flat", $avec(v)^flat$),
    row("intprod", $intprod_avec(v) omega$), row("lie", $lie_avec(v) omega$),
    row("pullback", $pullback(phi) omega$), row("pushforward", $pushforward(phi) avec(v)$),
    row("vol", $vol(Omega)$), row("", []),
  ),
  "Finite elements": (
    row("mesh", $mesh$), row("nodes", $nodes$),
    row("cells", $cells$), row("facets", $facets$),
    row("linf", $linf(l)(v)$), row("bilf", $bilf(a)(u, v)$),
    row("lagrange", $lagrange(1, mesh)$), row("lagrange0", $lagrange0(1, mesh)$),
    row("discont", $discont(0, mesh)$), row("", []),
    row("msize", $msize$), row("refcell", $refcell$),
    row("interp", $interp_msize u$), row("proj", $proj_msize u$),
  ),
  "FEEC": (
    row("simp", $simp$), row("simpcomp", $simpcomp$),
    row("poly", $poly(r, k, mesh)$), row("polytrim", $polytrim(r, k, mesh)$),
    row("forms", $forms(k, Omega)$), row("l2forms", $l2forms(k, Omega)$),
    row("hforms", $hforms(k, Omega)$), row("whitney", $whitney_simp$),
    row("cochains", $cochains^k (simpcomp)$), row("bdry", $bdry simp$),
    row("derham", $derham$), row("cohom", $cohom(k)(Omega)$),
  ),
  "Probability": (
    row("prob", $prob(A)$), row("expect", $expect[X]$),
    row("variance", $variance[X]$), row("cov", $cov(X, Y)$),
    row("corr", $corr(X, Y)$), row("given", $prob(A given B)$),
    row("distas", $X distas normal(0, 1)$), row("iid", $X_i iid normal(0, 1)$),
    row("normal", $normal(mu, Sigma)$), row("uniform", $uniform(0, 1)$),
    row("bernoulli", $bernoulli(p)$), row("poisson", $poisson(lambda)$),
    row("gammadist", $gammadist(alpha, beta)$), row("gp", $gp(m, kernel)$),
    row("kernel", $kernel(x, x')$), row("gram", $gram$),
    row("entropy", $entropy[X]$), row("kl", $kl(p || q)$),
    row("mutinfo", $mutinfo(X; Y)$), row("tvdist", $tvdist(p, q)$),
    row("filtration", $filtration_t$), row("quadvar", $quadvar(X)_t$),
    row("ito", $ito$), row("brown", $dif brown_t$),
    row("noise", $noise_t$), row("eqdist", $X eqdist Y$),
    row("convdist", $X_n convdist X$), row("convprob", $X_n convprob X$),
    row("convas", $X_n convas X$), row("", []),
  ),
  "Quantum": (
    row("ket", $ket(psi)$), row("bra", $bra(phi)$),
    row("braket", $braket(phi, psi)$), row("ketbra", $ketbra(psi, psi)$),
    row("ret", $G^ret$), row("adv", $G^adv$),
    row("lesser", $G^lesser$), row("greater", $G^greater$),
  ),
  // A mechanical family, so the sheet is the family itself.
  "Aliases": dictionary(aliases).pairs()
    .filter(((name, body)) => type(body) == content)
    .map(((name, body)) => row(name, body)),
)

// A label may carry the arguments it varies, as in "deriv n:2", so the name is
// its first word. A filler keeping the grid rectangular is named "".
#let name-of(label) = label.text.split(" ").at(0)

#let names(cells) = cells.chunks(2).map(pair => name-of(pair.first()))

#let exported = (
  notation, style, algebra, analysis, spaces, vector-calculus, exterior, fem,
  feec, probability, quantum, aliases,
).map(module => dictionary(module).keys()).flatten().dedup()

#let shown = sheets.values().map(cells => names(cells.flatten())).flatten()
#let unshown = exported.filter(name => name not in shown + shown-elsewhere)
#let unknown = shown.filter(name => name != "" and name not in exported)
#assert(unshown == (), message: "not shown: " + unshown.join(", "))
#assert(unknown == (), message: "no such export: " + unknown.join(", "))

#for (title, cells) in sheets {
  heading(title)
  table(
    columns: (auto, 1fr, auto, 1fr),
    stroke: none,
    align: (right + horizon, left + horizon, right + horizon, left + horizon),
    inset: (x: 5pt, y: 3.5pt),
    ..cells.flatten(),
  )
}
