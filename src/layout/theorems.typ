#import "@preview/ctheorems:1.1.3": thmbox, thmrules, thmproof


// One counter is shared by every kind, so a Theorem 2.3 is followed by a
// Definition 2.4. Nothing renders unless the document applies thmrules.
#let _env = thmbox.with(
  "dottyp",
  base_level: 1,
  separator: [*.* ],
  padding: (top: 0.4em, bottom: 0.4em),
  inset: 0pt,
)

#let theorem = _env("Theorem", bodyfmt: emph)
#let lemma = _env("Lemma", bodyfmt: emph)
#let corollary = _env("Corollary", bodyfmt: emph)
#let proposition = _env("Proposition", bodyfmt: emph)
#let definition = _env("Definition", bodyfmt: emph)

#let remark = _env("Remark")
#let example = _env("Example")

#let proof = thmproof("proof", "Proof", separator: [*.* ])
