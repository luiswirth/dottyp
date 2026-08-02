#import "notation.typ": *

// Intervals, Bourbaki style: the bracket points away from an excluded endpoint.
// The names read as the pair of endpoint kinds, open or closed.
#let oo(a, b) = $lr(\] #a, #b \[)$
#let cc(a, b) = $lr(\[ #a, #b \])$
#let oc(a, b) = $lr(\] #a, #b \])$
#let co(a, b) = $lr(\[ #a, #b \[)$

// Derivatives. The order is an argument rather than a separate name,
// so deriv(f, x) and deriv(f, x, n: 2) are the same construction.
#let deriv(f, x, n: 1) = if n == 1 { $(dif #f)/(dif #x)$ } else {
  $(dif^#n #f)/(dif #x^#n)$
}
#let pderiv(f, x, n: 1) = if n == 1 { $(partial #f)/(partial #x)$ } else {
  $(partial^#n #f)/(partial #x^#n)$
}

// Where a function lives and where it does not vanish.
#let dom = math.op("dom")
#let supp = math.op("supp")
#let esssup = math.op("ess sup", limits: true)
#let essinf = math.op("ess inf", limits: true)

// Norms and seminorms.
#let norm(a) = $lr(|| #a ||)$
#let abs(a) = $lr(| #a |)$

// Extremizers, with the argument set below the operator in display style.
#let argmin = math.op("arg min", limits: true)
#let argmax = math.op("arg max", limits: true)

// Asymptotics.
#let bigo = math.cal("O")
#let smallo = math.italic("o")
