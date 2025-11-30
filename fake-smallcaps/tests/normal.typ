#import "../lib.typ": *

#set text(font: "New Computer Modern", size: 20pt)
#set page(margin: 1cm, height: auto)

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  [*Regular*], lorem(30),
  [*Small-caps*], smallcaps(lorem(30)),
  [*Fake*], fake-smallcaps(lorem(30), scaling: 0.75),
)


#let fakesc(s, scaling: 0.75) = {
  show regex("\p{Ll}+"): it => {
    context text(scaling * 1em, stroke: 0.01em + text.fill, upper(it))
  }
  text(s)
}

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  [*Regular*], lorem(30),
  [*Small-caps*], smallcaps(lorem(30)),
  [*Fake*], fakesc(lorem(30), scaling: 0.8),
)
