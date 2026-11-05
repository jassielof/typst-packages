#import "../lib.typ" as orchid
#let sample-id = "0000-0002-1825-0097"
#let sample-name = [Josiah Carberry]

#set document(
  title: [Orchid Manual],
  author: "Jassiel Ovando F.",
)

#set text(
  lang: "en",
  font: "Inter",
  discretionary-ligatures: true,
  stylistic-set: (3, 2),
  features: ("calt",),
)

#show raw: set text(
  font: ("Consolas", "Inconsolata EX"),
  size: 10pt,
)

#show link: set text(fill: rgb("#0b5cad"))

#import "@preview/codly:2.0.0"

#show raw.where(block: true): codly.new

#let demo(code) = grid(
  columns: 1,
  row-gutter: 1em,
  align: horizon,
  raw(
    code,
    block: true,
    lang: "typst",
  ),
  eval(
    code,
    mode: "markup",
    scope: (
      orchid: orchid,
      my-id: sample-id,
      my-name: sample-name,
    ),
  ),
)

#title()

Orchid is a small tool to display ORCID iDs in Typst. Mainly inspired by LaTeX's `orcidlink` package.

The main function, `orchid.orcid`, only produces the iD itself. To combine it with a name, write them next to each other (`[Josiah Carberry #orchid.orcid(my-id)]`).

= Options

Every look is a combination of three independent options:

#table(
  columns: (auto, auto, 1fr),
  table.header[*Option*][*Values*][*Description*],
  [`icon`], [`"before"` (default), `"after"`, `none`], [Position of the ORCID iD icon, or no icon.],
  [`display`],
  [`"url"` (default), `"id"`, `none`],
  [Text shown: the full `https://orcid.org/...` URL, the bare iD, or nothing.],

  [`linked`], [`"all"` (default), `"text"`, `none`], [What is a hyperlink: icon and text, only the text, or nothing.],
  [`gap`], [length, default `0.25em`], [Space between icon and text.],
  [`size`], [length, default `1em`], [Size of the icon.],
  [`logo`], [content, default `none`], [Replaces the default icon.],
  [`alt`], [string, default `"ORCID iD"`], [Alternative text of the default icon.],
)

= Accessibility

The default icon has alternative text (`alt`), so documents built with `--pdf-standard ua-1` compile. If you pass your own `logo` image, give it an `alt` too.

= Validation

The iD is validated in two steps. The format must be `0000-0000-0000-000X`, and the last character must be a valid ISO 7064 mod 11-2 check digit. A mistyped iD that still looks valid fails at compile time. A full `https://orcid.org/...` URL is also accepted as input, and surrounding whitespace and a lowercase `x` are normalized.

#outline(
  title: [List of Examples],
  target: figure.where(kind: "example"),
)

#pagebreak()
= Examples

ORCID's own guidelines ask for the icon plus the full URL, hyperlinked, so that is the default. It also matches the order APA uses (name, icon, URL).

#show figure: set align(left)
#set figure.caption(position: top)
#show figure.caption: set text(weight: "semibold", style: "italic")

#set figure(
  supplement: [Example],
  kind: "example",
)

#figure(
  demo("#orchid.orcid(my-id)"),
  caption: [Default without the name],
)

#figure(
  demo("Josiah Carberry #orchid.orcid(my-id)"),
  caption: [Default with the name],
)

#figure(
  demo("#orchid.orcid(my-id, display: none)"),
  caption: [Icon only],
)

#figure(
  demo("#orchid.orcid(my-id, display: \"id\")"),
  caption: [iD only],
)

#figure(
  demo("#orchid.orcid(my-id, display: \"id\", icon: \"after\")"),
  caption: [iD only, icon after],
)

#figure(
  demo("#orchid.orcid(my-id, icon: none)"),
  caption: [No icon],
)

#figure(
  demo("#orchid.orcid(my-id, icon: none, display: \"id\")"),
  caption: [No icon, iD only],
)

== Controlling the link
By default the icon and the text form a single link. You can link only the text, or not link at all.

#figure(
  demo("#orchid.orcid(my-id, linked: \"text\")"),
  caption: [Link only the text],
)
#figure(
  demo("#orchid.orcid(my-id, linked: none)"),
  caption: [No link],
)

== Getting only the URL

If you need the URL as a string, for example for your own link text:

#figure(
  demo("#link(orchid.orcid-url(my-id))[My ORCID profile]"),
  caption: [Link to the ORCID profile],
)

== Customizing the icon
Pass any content to `logo` to replace the default icon. It is wrapped in the same sized box, so `size` and `icon` still apply.

#figure(
  demo("#orchid.orcid(my-id, logo: emoji.id)"),
  caption: [Custom icon],
)

