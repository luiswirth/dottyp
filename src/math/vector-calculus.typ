#import "notation.typ": *

// The first-order operators of three-dimensional vector calculus.
// grad and curl produce vectors and are set bold; div produces a scalar.
#let grad = math.op(avec("grad"))
#let curl = math.op(avec("curl"))
#let div = math.op("div")

// The two-dimensional curl, whose value is a scalar, and its rotated partner.
#let scurl = math.op("curl")
#let rot = math.op(avec("rot"))

// The second-order operators. Hess is a matrix and is set bold, lapl its trace.
#let hess = math.op(amat("Hess"))
#let lapl = sym.Delta
#let dalem = sym.square
