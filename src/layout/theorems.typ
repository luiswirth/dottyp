#import "@preview/ctheorems:1.1.3": thmbox, thmrules, thmproof

// Theorem environments, on ctheorems rather than hand-rolled counters: what a
// counter cannot give is referencing.
//
// One counter is shared by every kind and numbered within the section, so
// Theorem 2.3 is followed by Definition 2.4 and a reader never has to ask
// which sequence a number belongs to.
//
// A document must apply thmrules for any of this to render:
//
//   #show: thmrules

#let _env = thmbox.with(
  "dottyp",
  base_level: 1,
  separator: [*.* ],
  padding: (top: 0.4em, bottom: 0.4em),
  inset: 0pt,
)

// Statements are emphasized, as they carry the claim.
#let theorem = _env("Theorem", bodyfmt: emph)
#let lemma = _env("Lemma", bodyfmt: emph)
#let corollary = _env("Corollary", bodyfmt: emph)
#let proposition = _env("Proposition", bodyfmt: emph)
#let definition = _env("Definition", bodyfmt: emph)

// Prose around the statements stays upright.
#let remark = _env("Remark")
#let example = _env("Example")

#let proof = thmproof("proof", "Proof", separator: [*.* ])
