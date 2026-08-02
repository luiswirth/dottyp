#import "@local/dottyp:0.1.0": *

#show: document-style
#show: thmrules

#show: preface-style
= Preface
Roman page numbers, unnumbered headings, no chapter label.

#show: body-style
= Sections
== Boxes

#titlebox("A titled panel")[
  The bar takes the emphasis color, the body the surface color, both from the
  theme rather than from a literal.
]

#framed[A plain framed block.]

Inline #circletext[3] sits on the baseline.

#finishline

#importanteq[$ dif star dif u = f. $]

== Theorem environments

#definition[A #emph[form] is a section of $altpow(k, T^* M)$.]

#theorem[Stokes][
  $ integral_(partial M) pullback(iota) omega = integral_M dif omega. $
] <stokes>

#proof[By partition of unity.]

#remark[Remarks are upright, unlike the statements above.]

@stokes is referenced by its shared counter.

#show: appendix-style
= An appendix
Letter numbering, subheadings kept out of the outline.

#show: postface-style
= A postface
Lowercase roman numerals, restarted.
