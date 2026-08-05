// The whole library, minus the opt-in shorthands.
//
// Two halves: math/ is the notation a document writes, layout/ is the shape it
// is written in.
//
// No name is defined twice across these modules: a glob import of the lot is
// unambiguous, and a name means one thing wherever it is read.
//
//   #import "@local/dottyp:0.1.0": *              everything
//   #import "@local/dottyp:0.1.0": exterior       one module, qualified
//   #import "@local/dottyp:0.1.0": aliases        the opt-in shorthands
//   #import aliases: *

#import "math/notation.typ": *
#import "math/style.typ": *
#import "math/algebra.typ": *
#import "math/analysis.typ": *
#import "math/spaces.typ": *
#import "math/vector-calculus.typ": *
#import "math/exterior.typ": *
#import "math/fem.typ": *
#import "math/feec.typ": *
#import "math/probability.typ": *
#import "math/quantum.typ": *

#import "layout/theme.typ": *
#import "layout/typeface.typ": *
#import "layout/template.typ": *
#import "layout/sections.typ": *
#import "layout/blocks.typ": *
#import "layout/theorems.typ": *
#import "layout/documents.typ": *

// The same modules as handles, for documents that would rather qualify a name
// than pull the whole library into scope.
#import "math/notation.typ" as notation
#import "math/style.typ" as style
#import "math/algebra.typ" as algebra
#import "math/analysis.typ" as analysis
#import "math/spaces.typ" as spaces
#import "math/vector-calculus.typ" as vector-calculus
#import "math/exterior.typ" as exterior
#import "math/fem.typ" as fem
#import "math/feec.typ" as feec
#import "math/probability.typ" as probability
#import "math/quantum.typ" as quantum

#import "layout/theme.typ" as theme
#import "layout/typeface.typ" as typeface
#import "layout/template.typ" as template
#import "layout/sections.typ" as sections
#import "layout/blocks.typ" as blocks
#import "layout/theorems.typ" as theorems
#import "layout/documents.typ" as documents

// Never re-exported wholesale: importing it puts 77 single letters in scope.
#import "math/aliases.typ" as aliases
