#import "@local/dottyp:0.1.0": *

#show: document-style.with(colors: dark-theme)
#show: notes-style
#show: thmrules

= Notes
Headings are bands across the page, and nothing starts on a fresh one.

== Boxes on a dark page

#titlebox("A titled panel")[Every color comes from the theme.]

#framed[A plain framed block.]

Inline #circletext[3] sits on the baseline. A #link("https://lwirth.com")[link].

#finishline

A #term("cochain") is bold, and #key[a key sentence is legible on a dark page.]

#importanteq[$ dif star dif u = f. $]

An unreferenced display carries no number,
$ a^2 + b^2 = c^2, $
and a referenced one carries the next,
$ e^(ii pi) + 1 = 0, $ <euler>
so @euler is the first number on the page.

#theorem[Statements read the same way on either theme.]
