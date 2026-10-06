#import "../lib.typ" as orchid
#let my-id = "0000-0002-1825-0097"
#let my-name = [John Doe]

#set document(title: [Orchid manual])
#set text(lang: "en")
// Typst does not style links by default; do it here so the `linked` option is visible.
#show link: set text(fill: rgb("#0b5cad"))
#show link: underline

// Shows the code and its rendered result side by side.
#let demo(code) = grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  align: horizon,
  raw(code, lang: "typst"),
  eval(
    code,
    mode: "markup",
    scope: (orchid: orchid, my-id: my-id, my-name: my-name),
  ),
)

= Orchid
Orchid is a small tool to display ORCID iDs in Typst. Mainly inspired by LaTeX's `orcidlink` package.

The main function, `orchid.orcid`, only produces the iD itself. To combine it with a name, write them next to each other (`[John Doe #orchid.orcid(my-id)]`).

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

= Examples
== Default
ORCID's own guidelines ask for the icon plus the full URL, hyperlinked, so that is the default. It also matches the order APA uses (name, icon, URL).

#demo("#orchid.orcid(my-id)")
#demo("John Doe #orchid.orcid(my-id)")

== Icon only
#demo("#orchid.orcid(my-id, display: none)")

== Bare iD
#demo("#orchid.orcid(my-id, display: \"id\")")
#demo("#orchid.orcid(my-id, display: \"id\", icon: \"after\")")

== Without icon
#demo("#orchid.orcid(my-id, icon: none)")
#demo("#orchid.orcid(my-id, icon: none, display: \"id\")")

== Controlling the link
By default the icon and the text form a single link. You can link only the text, or not link at all.

#demo("#orchid.orcid(my-id, linked: \"text\")")
#demo("#orchid.orcid(my-id, linked: none)")

== Getting only the URL
If you need the URL as a string, for example for your own link text:

#demo("#link(orchid.orcid-url(my-id))[My ORCID profile]")

= Accessibility
The default icon has alternative text (`alt`), so documents built with `--pdf-standard ua-1` compile. If you pass your own `logo` image, give it an `alt` too.

= Validation
The iD is validated in two steps. The format must be `0000-0000-0000-000X`, and the last character must be a valid ISO 7064 mod 11-2 check digit. A mistyped iD that still looks valid fails at compile time. A full `https://orcid.org/...` URL is also accepted as input, and surrounding whitespace and a lowercase `x` are normalized.

= Customizing the icon
Pass any content to `logo` to replace the default icon. It is wrapped in the same sized box, so `size` and `icon` still apply.

#raw(
  block: true,
  lang: "typst",
  "#orchid.orcid(my-id, logo: image(\"my-logo.svg\", alt: \"My logo\"))",
)
