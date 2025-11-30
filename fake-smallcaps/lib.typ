#let fake-bold(stroke: auto, base-weight: auto, weight: auto, s, ..params) = {
  let t-weight = if base-weight == auto { weight } else { base-weight }
  assert(
    t-weight in (auto, none) or type(t-weight) in (str, int),
    message: "`base-weight`/`weight` should be `auto`, `none`, `int` or `str` type.",
  )
  assert(
    stroke == auto or type(stroke) in (std.stroke, length),
    message: "`stroke` shoule be `auto`, `length` or `stroke` type.",
  )
  set text(weight: t-weight) if type(t-weight) in (str, int)
  set text(weight: "regular") if t-weight == none
  set text(..params) if params != ()
  context {
    let t-stroke = if stroke == auto { 0.02857em + text.fill } else if type(stroke) == length {
      stroke + text.fill
    } else { stroke }
    set text(stroke: t-stroke)
    s
  }
}

// This works fine, but breaks/messes up the justification in paragraphs.
// #let fake-smallcaps(s, scaling: 0.65, expansion: 1.05, stroke: 0.005cm) = {
//   show regex("\p{Ll}+"): it => context {
//     box(
//       scale(
//         x: expansion * 100%,
//         reflow: true,
//         origin: center + bottom,
//         text(
//           size: scaling * 1em,
//           upper(
//             fake-bold(
//               it,
//               stroke: stroke,
//             ),
//           ),
//         ),
//       ),
//     )
//   }

//   text(s)
// }

#set text(font: "Libertinus Sans", size: 20pt, tracking: 0.1cm)
#set par(justify: true)
#set page(margin: 1cm, height: auto)

// #table(
//   columns: (auto, 1fr),
//   stroke: 0.5pt,
//   [*Regular*], lorem(30),
//   [*Small-caps*], smallcaps(lorem(30)),
//   [*Fake*], fake-smallcaps(lorem(30)),
// )


// This doesn't breaks the justification, but the tracking (or box scaling from before) is ignore when there's an upper small cap.
// For example, suppose a normal tracking: "T h i s" (in smallcaps)
// Now with the fake smallcaps from below: "Th i s", the "T" and "h" don't have tracking applied each is a different text group.
#let fake-smallcaps(s, scaling: 0.75, stroke: 0.005cm) = context {
  show regex("\p{Ll}+"): it => {
    text(
      size: scaling * 1em,
      stroke: stroke + text.fill,
      upper(it),
    )
  }

  text(s)
}

#let my-fake-sc(body) = fake-smallcaps(body, scaling: 0.75, stroke: 0.0075cm)

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt,
  [*Regular*], lorem(30),
  [*Small-caps*], smallcaps(lorem(30)),
  [*Fake*], my-fake-sc(lorem(30)),
)
