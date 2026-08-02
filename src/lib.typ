// The whole library, minus the opt-in shorthands.
//
// No name is defined twice across these modules: a glob import of the lot is
// unambiguous, and a name means one thing wherever it is read.
//
//   #import "@local/dottyp:0.1.0": *              everything
//   #import "@local/dottyp:0.1.0": exterior       one module, qualified
//   #import "@local/dottyp:0.1.0": aliases        the opt-in shorthands
//   #import aliases: *

#import "notation.typ": *
#import "style.typ": *
#import "algebra.typ": *
#import "analysis.typ": *
#import "spaces.typ": *
#import "vector-calculus.typ": *
#import "exterior.typ": *
#import "fem.typ": *
#import "feec.typ": *
#import "probability.typ": *

// The same modules as handles, for documents that would rather qualify a name
// than pull the whole library into scope.
#import "notation.typ" as notation
#import "style.typ" as style
#import "algebra.typ" as algebra
#import "analysis.typ" as analysis
#import "spaces.typ" as spaces
#import "vector-calculus.typ" as vector-calculus
#import "exterior.typ" as exterior
#import "fem.typ" as fem
#import "feec.typ" as feec
#import "probability.typ" as probability

// Never re-exported wholesale: importing it puts 104 single letters in scope.
#import "aliases.typ" as aliases
