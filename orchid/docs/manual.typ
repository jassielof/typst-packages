#import "../lib.typ" as orchid
#let my-id = "0000-0000-0000-0000"
#let my-name = [John Doe]

= Orchid
Orchid is a simple tool to generate ORCID iD links in various formats. Mainly inspired by LaTeX's `orcidlink` package.

= Formats
== Logo
- #orchid.generate-link(my-id)
- #orchid.generate-link(my-id, name: my-name)
- #orchid.generate-link(my-id, name: my-name, position: "right")

== Compact
- #orchid.generate-link(my-id, format: "compact")
- #orchid.generate-link(my-id, format: "compact", name: my-name)
- #orchid.generate-link(my-id, format: "compact", name: my-name, position: "right")

== Compact with logo
- #orchid.generate-link(my-id, format: "compact-logo")
- #orchid.generate-link(my-id, format: "compact-logo", logo-position: "after")
- #orchid.generate-link(my-id, format: "compact-logo", name: my-name)
- #orchid.generate-link(my-id, format: "compact-logo", name: my-name, logo-position: "after")
- #orchid.generate-link(my-id, format: "compact-logo", name: my-name, position: "right")

== Full
- #orchid.generate-link(my-id, format: "full")
- #orchid.generate-link(my-id, format: "full", name: my-name)
- #orchid.generate-link(my-id, format: "full", name: my-name, position: "right")

== Full with logo
- #orchid.generate-link(my-id, format: "full-logo")
- #orchid.generate-link(my-id, format: "full-logo", logo-position: "after")
- #orchid.generate-link(my-id, format: "full-logo", name: my-name, position: "right")

== Customizing the logo icon
To customize the logo icon you can just overwrite the `logo-icon` variable, for example:

#raw(
  block: true,
  read("assets/snippets/logo-overwrite.typ"),
  lang: "typst",
)

#image(
  "assets/images/logo-overwrite.svg",
)
